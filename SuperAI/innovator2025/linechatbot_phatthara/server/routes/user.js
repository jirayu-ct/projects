const express = require('express');
const { getUser } = require('../controllers/user');
const { verifyToken } = require('../middlewares/authCheck');
const router = express.Router();

router.get('/get-user', verifyToken, getUser);

module.exports = router;
