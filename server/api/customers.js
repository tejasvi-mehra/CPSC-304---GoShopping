import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET customers listing. */
router.get('/customers', function (req, res, next) {
  const query = 'SELECT * FROM Customers;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(customers => {
      console.log(customers)
      res.json(customers)
    })
})

router.post('/customers/name', bodyParser.json(), function (req, res, next) {
  const options = req.body.data.options
  const name = req.body.data.name
  var temp = 'SELECT ' + options
  const query = temp + ' from Customers WHERE name = :name;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        name: name
      }
    })
    .then(result => {
      console.log(result)
      res.send(JSON.stringify(result))
    })
})

router.post('/customers/delete', bodyParser.json(), function (req, res, next) {
//  console.log("HERE-------------------");
  const customer_id = req.body.data.customer_id
  const query = 'DELETE FROM Customers WHERE customer_id = :customer_id;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        customer_id: customer_id
      }
    })
    .then(result => {
      console.log(result)
      res.send('/customers')
    })
})

export default router
