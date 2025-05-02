const prisma = require("../config/prisma");

exports.getAllGrades = async(req, res) => {
    try {
        const grades = await prisma.grade.findMany()

        return res.json({
            status: 'success',
            message: 'Get all grades successfully!',
            data: grades
        })
    }
    catch(err) {
        console.log('Error in getAllGrades: ', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        })
    }
}


exports.getGradeByStudent = async(req, res) => {
    try {
        const { studentId } = req.params;
        const { term, academicYear } = req.body;

        if(!studentId || !term || !academicYear) {
            return res.status(400).json({
                status: 'error',
                message: 'Missing required fields'
            })
        }

        const grade = await prisma.grade.findMany({
            where: {
                studentId: Number(studentId),
                term,
                academicYear: Number(academicYear)
            },
            include: {
                subject: {
                    select: {
                        name: true,
                        code: true,
                        credits: true
                    }
                }
            }
        })
        

        return res.json({
            status: 'success',
            message: 'Get grade by students successfully!',
            data: grade
        })
    }
    catch(err) {
        console.log('Error in getGradeByStudents: ', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        })
    }
}

