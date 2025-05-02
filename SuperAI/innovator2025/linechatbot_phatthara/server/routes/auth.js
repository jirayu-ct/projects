// import
const express = require('express');
const { register, login } = require('../controllers/auth');
const { verifyToken, checkRole } = require('../middlewares/authCheck');
const { role } = require('../util/allRole');
const router = express.Router();

//import controller


router.post('/register', register);
router.post('/login', login);




module.exports = router;