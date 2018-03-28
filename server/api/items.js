import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET items listing. */
router.get('/items', function (req, res, next) {
  const query = 'SELECT * FROM Items;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(items => {
      console.log(items)
      res.json(items)
    })
})

router.get('/items/:item_id', function (req, res, next) {
  console.log(req.query)
  const item_id = req.params.item_id
  console.log("ID:-------------------" + item_id)
  const query = 'SELECT * FROM Items WHERE item_id = :item_id ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        item_id: item_id
      }
    })
    .then(items => {
      if (items.length === 1 ) {
        res.json(items[0])
      } else {
        res.status(404).json({})
      }
    })
})

router.post('/items/update', bodyParser.json(), function (req, res, next) {
  const item_id = req.body.data.item_id;
  const item_name = req.body.data.item_name;
  const manufacturer = req.body.data.manufacturer;
  const item_quantity = req.body.data.item_quantity;
  const price = req.body.data.price;
  const category_id = req.body.data.category_id;


  const query = 'UPDATE items SET item_quantity = :item_quantity WHERE item_id = :item_id ;';
  connection.query(query, {
    type: connection.QueryTypes.UPDATE,
    replacements: {
      item_quantity: item_quantity,
      item_id: item_id
    }
  }).then (result => {
    // result[1] is the number of rows changed
    res.send('/items');
  });
});

export default router
