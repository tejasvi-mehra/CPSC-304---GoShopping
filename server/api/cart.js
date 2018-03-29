import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET cart listing. */
router.get('/cart', function (req, res, next) {
  const query = 'SELECT * FROM Cart;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(cart => {
      console.log(cart)
      res.json(cart)
    })
})

router.get('/cart/all_items', function (req, res, next) {
  const query = 'SELECT DISTINCT cart_id FROM Cart C WHERE NOT EXISTS (SELECT T.category_id FROM Category T WHERE NOT EXISTS ( SELECT P.cart_id  FROM (SELECT * FROM Cart NATURAL JOIN Items) P WHERE P.cart_id = C.cart_id));'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT
    })
    .then(result => {
      console.log(result)
      res.send(JSON.stringify(result))
    })
})


export default router
