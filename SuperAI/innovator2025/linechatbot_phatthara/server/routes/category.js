const express = require('express');
const { create, list, remove } = require('../controllers/category');
const { verifyToken, roleTeacherAndAdmin, roleTeacher } = require('../middlewares/authCheck');
const { Permission } = require('@prisma/client');

const router = express.Router();

// Allow both admin and teacher to access these routes
router.post('/category', verifyToken, create);
router.get('/category', verifyToken, roleTeacherAndAdmin, list);
router.delete('/category/:id', verifyToken, remove);


module.exports = router;