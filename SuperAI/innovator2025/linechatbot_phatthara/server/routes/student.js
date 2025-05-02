const express = require('express');
const { getAllStudentsWithDetails, getStudentProfileById, getStudentsByClassGroup, updateStudent } = require('../controllers/student');
const { verifyToken, roleTeacherAndAdmin } = require('../middlewares/authCheck');
const router = express.Router();

// Get all students with details
router.get('/students', verifyToken, roleTeacherAndAdmin, getAllStudentsWithDetails);

// Get student profile by ID
router.get('/students/:id', verifyToken, getStudentProfileById);

// Get students by class group
router.get('/students/class-groups/:id', verifyToken, getStudentsByClassGroup);

// Update student
// router.put('/students/:id', verifyToken, updateStudent);

module.exports = router;
