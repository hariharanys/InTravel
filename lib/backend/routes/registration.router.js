const router = require('express').Router();

const register_controller = require('../controller/registration.controller');

router.post('/registration',register_controller.registration_control);

module.exports=router; 