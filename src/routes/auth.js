const router = require('express').Router()
const authController = require('../controllers/auth')

router
    .post('/check', authController.emailCheck)
    .post('/login', authController.postLogin)
    .post('/register', authController.postRegister)
    .patch('/forgot', authController.forgotPassword)
    .post('/sendEmail', authController.sendEmail)

module.exports = router