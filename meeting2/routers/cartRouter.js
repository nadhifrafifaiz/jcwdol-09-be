const express = require('express')
const { cartController } = require('../controllers/index')
const router = express.Router()

router.get('/', cartController.fetchCarts)

module.exports = router
