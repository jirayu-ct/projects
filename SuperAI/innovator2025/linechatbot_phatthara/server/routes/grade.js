const express = require('express');
const { getAllGrades, getGradeByStudent } = require('../controllers/grade');
const router = express.Router();



router.get('/grades', getAllGrades)
router.get('/grades/:studentId', getGradeByStudent)

module.exports = router;
