const prisma = require("../config/prisma");

exports.getAllStudentsWithDetails = async (req, res) => {
    try {
        const student = await prisma.student.findMany({
            select: {
                id: true,
                status: true,
                user: {
                    select: {
                        username: true,
                        email: true,
                        firstName: true,
                        lastName: true,
                        birthDate: true,
                        gender: true,
                        address: true,
                        phone: true,
                        enabled: true,
                        image: true,
                    }
                },
                classGroup: {
                    select: {
                        name: true
                    }
                },
                behavior: {
                    select: {
                        type: true,
                        description: true,
                        date: true
                    }
                },
                StudentActiviti: {
                    select: {
                        participationStatus: true,
                        note: true,
                        activiti: {
                            select: {
                                name: true,
                                description: true,
                                startDate: true,
                                endDate: true,
                                location: true
                            }
                        }
                    }
                },
                StudentParents: {
                    select: {
                        isPrimary: true,
                        parent: {
                            select: {
                                description: true,
                                status: true,
                                user: {
                                    select: {
                                        firstName: true,
                                        lastName: true,
                                        gender: true,
                                        email: true,
                                        phone: true,
                                        image: true,
                                    }
                                }
                            }
                        }
                    }
                },
                StudentAdvisor: {
                    select: {
                        teacher: {
                            select: {
                                status: true,
                                user: {
                                    select: {
                                        firstName: true,
                                        lastName: true,
                                        gender: true,
                                        email: true,
                                        phone: true,
                                        image: true,
                                    }
                                },
                                department: {
                                    select: {
                                        name: true,
                                    }
                                }
                            }
                        },
                        advisorRole: true,
                        advisorStatus: true
                    }
                },

            }
        });

        res.json({
            status: 'success',
            message: 'Get Student Details Successfully!',
            payload: student
        })
    }
    catch (err) {
        console.log('Error in get student details: ', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        })
    }
}

exports.getStudentProfileById = async (req, res) => {
    try {
        const { id } = req.params;

        const student = await prisma.student.findUnique({
            where: {
                id: Number(id)
            }
        })

        if (!student) {
            return res.status(404).json({
                status: 'error',
                message: 'Student not found'
            })
        }

        const studentDetails = await prisma.student.findMany({
            where: {
                id: Number(id)
            },
            select: {
                user: {
                    select: {
                        username: true,
                        email: true,
                        firstName: true,
                        lastName: true,
                        birthDate: true,
                        gender: true,
                        address: true,
                        phone: true,
                        enabled: true,
                        image: true,
                    }
                },
                classGroup: {
                    select: {
                        name: true
                    }
                },
                behavior: {
                    select: {
                        type: true,
                        description: true,
                        date: true
                    }
                },
                StudentActiviti: {
                    select: {
                        participationStatus: true,
                        note: true,
                        activiti: {
                            select: {
                                name: true,
                                description: true,
                                startDate: true,
                                endDate: true,
                                location: true
                            }
                        }
                    }
                },
                StudentParents: {
                    select: {
                        isPrimary: true,
                        parent: {
                            select: {
                                description: true,
                                status: true,
                                user: {
                                    select: {
                                        firstName: true,
                                        lastName: true,
                                        gender: true,
                                        email: true,
                                        phone: true,
                                        image: true,
                                    }
                                }
                            }
                        }
                    }
                },
                StudentAdvisor: {
                    select: {
                        teacher: {
                            select: {
                                status: true,
                                user: {
                                    select: {
                                        firstName: true,
                                        lastName: true,
                                        gender: true,
                                        email: true,
                                        phone: true,
                                        image: true,
                                    }
                                },
                                department: {
                                    select: {
                                        name: true,
                                    }
                                }
                            }
                        },
                        advisorRole: true,
                        advisorStatus: true
                    }
                }
            }
        })

        res.json({
            status: 'success',
            message: 'Get Student By ID Successfully!',
            data: studentDetails
        })
    }
    catch (err) {
        console.log('Error in get student by id: ', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        })
    }
}

exports.getStudentsByClassGroup = async (req, res) => {
    try {
        const { id } = req.params;

        const studentsClassGroup = await prisma.classGroups.findMany({
            where: {
                id: Number(id)
            },
            include: {
                student: {
                    select: {
                        id: true,
                        status: true,
                        user: {
                            select: {
                                firstName: true,
                                lastName: true,

                            }
                        }
                    }
                }
            }
        })

        res.json({
            status: 'success',
            message: 'Get Student By Class ID Successfully!',
            data: studentsClassGroup
        })
    }
    catch (err) {
        console.log('Error in get student by class id: ', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        })
    }
}

//ไว้ก่อน
// exports.updateStudent = async (req, res) => {
//     try {

//         const { id } = req.params;
//         const {
//             firstName,
//             lastName,
//             birthDate,
//             gender,
//             address,
//             phone,
//             status,
//             classGroupId,
//             advisorId,
//             parentId,
            
//         } = req.body;


//         return res.json({
//             status: 'success',
//             message: 'Update Student Successfully!'
//         })
//     }
//     catch (err) {
//         console.log('Error in update student: ', err);
//         return res.status(500).json({
//             status: 'error',
//             message: 'An unexpected error occurred. Please try again later.'
//         })
//     }
// }