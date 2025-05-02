const express = require('express');
const router = express.Router();
const { addRole, getRole, deleteRole } = require('../controllers/role');
const { verifyToken } = require('../middlewares/authCheck');

// เพิ่ม role
router.post('/role', verifyToken, addRole);

// ดึง role ของ user
router.get('/role/:userId', verifyToken, getRole);

// ลบ role ของ user
router.delete('/role/:userId/:role', verifyToken, deleteRole);

module.exports = router;
