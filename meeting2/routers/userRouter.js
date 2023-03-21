const express = require("express")
const { userController } = require('../controllers/index')
const router = express.Router()

router.get("/", userController.fetchUsers)
router.post("/", userController.register)
router.delete("/:id", userController.deleteUser)



module.exports = router