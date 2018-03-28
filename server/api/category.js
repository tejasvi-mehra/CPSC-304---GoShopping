import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET category listing. */
router.get('/category', function (req, res, next) {
  const query = 'SELECT * FROM Category;'
  connection.query  (query, { type: connection.QueryTypes.SELECT })
    .then(category => {
      console.log(category)
      res.json(category)
    })
})

router.get('/category/average_max', function (req, res, next) {
  const query = 'SELECT category_id, category_name, avg FROM CategoryAvgPrice WHERE avg = (SELECT MAX(avg) FROM CategoryAvgPrice);'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT
    })
    .then(result => {
      console.log(result)
      res.send(JSON.stringify(result))
    })
})


router.get('/category/average_min', function (req, res, next) {
  const query = 'SELECT category_id, category_name, avg FROM CategoryAvgPrice WHERE avg = (SELECT MIN(avg) FROM CategoryAvgPrice);'
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
