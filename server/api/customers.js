import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET customers listing. */
router.get('/customers', function (req, res, next) {
  const query = 'SELECT * FROM Customers;'
  // console.log("here------------------------------------------------------------");
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(customers => {
      console.log(customers)
      res.json(customers)
    })
})

/* GET customers by name. */
router.post('/customers/name', bodyParser.json(), function (req, res, next) {
  // console.log("HERE----------------------------")
  const fname = req.body.data.fname
  const query = 'SELECT name FROM Customers WHERE Customers.name = :fname ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        fname: fname
      }
    })
    .then(customers => {
      console.log(customers)
      res.json(customers)
      // res.send('/customers/name')
    })
})

export default router
