const prisma = require("../config/prisma");

exports.getUser = async (req, res) => {
    try {
        const user = await prisma.user.findMany({
            select: {  // ใช้ select แทน include เพื่อระบุฟิลด์ที่ต้องการ
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
                createdAt: true,
                updatedAt: true,
                userRoles: {  // ใช้ select กับ userRoles ด้วย
                    select: {
                        role: true
                    }
                }
            }
        })

        res.json({
            status: 'success',
            message: 'User fetched successfully',
            data: user
        })
    }
    catch (err) {
        console.log('Error in getUser controller', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        })
    }
}