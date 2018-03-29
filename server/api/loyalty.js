import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET loyalty listing. */
router.get('/loyalty', function (req, res, next) {
  const query = 'SELECT customers.name, loyalty.points from loyalty inner join customers on loyalty.customer_id = customers.customer_id;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(loyalty => {
      console.log(loyalty)
      res.json(loyalty)
    })
})

export default router
