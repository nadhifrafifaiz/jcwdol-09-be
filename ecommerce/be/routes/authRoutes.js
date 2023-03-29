const express = require('express')
const { authController } = require('../controllers')
const { verifyToken, checkRole } = require('../middleware/auth')

const router = express.Router()

router.post('/', authController.register)
router.get('/', authController.login)
router.get('/user', verifyToken, checkRole, authController.fetchAllUser)
router.get('/user/:id', verifyToken, authController.fetchUser)

module.exports = router