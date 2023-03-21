const express = require("express")
const { productController } = require('../controllers/index')
const router = express.Router()

router.get('/', productController.fetchProducts)

module.exports = router