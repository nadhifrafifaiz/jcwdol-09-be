const express = require("express")
const { priceController } = require('../controllers/index')
const router = express.Router()
const { getSum, plusOne } = require('../helper/calculateNumber')

router.get('/', getSum, plusOne, priceController.fetchPrice)

module.exports = router