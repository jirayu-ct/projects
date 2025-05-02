const prisma = require("../config/prisma");
const { checkUser } = require("../util/checkUser");

exports.addRole = async(req, res) => {
    try{
        const { userId, newRole } = req.body;

        if(!userId || !newRole) {
            return res.status(400).json({
                status: 'error',
                message: 'Missing required fields'
            })
        }

        // ตรวจสอบว่ามี user นี้จริงหรือไม่
        const userCheck = await checkUser(userId);
        if(userCheck.status === 'error') {
            return res.status(userCheck.code).json({
                status: 'error',
                message: userCheck.message
            })
        }

        // ตรวจสอบ role ที่มีอยู่
        const existingRoles = await prisma.userRole.findMany({
            where: {
                userId: userId
            },
            select: {
                role: true
            }
        });

        console.log("existingRoles: ", existingRoles);

        // ตรวจสอบว่า role ใหม่ซ้ำกับที่มีอยู่หรือไม่
        const isDuplicate = existingRoles.some(role => role.role === newRole);
        
        if (isDuplicate) {
            return res.status(400).json({
                status: 'error',
                message: 'User already has this role'
            });
        }

        // เพิ่ม role ใหม่
        const addedRole = await prisma.userRole.create({
            data: {
                userId: userId,
                role: newRole
            }
        });

        return res.status(201).json({
            status: 'success',
            message: 'Role added successfully',
            data: addedRole
        });

    } catch(err) {
        console.error('Error in addRole:', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        });
    }
}

exports.getRole = async(req, res) => {
    try{
        const { userId } = req.params;

        // ตรวจสอบ user
        const userCheck = await checkUser(Number(userId));
        if(userCheck.status === 'error') {
            return res.status(userCheck.code).json({
                status: 'error',
                message: userCheck.message
            })
        }

        const roles = await prisma.userRole.findMany({
            where: {
                userId: Number(userId)
            }
        });

        return res.status(200).json({
            status: 'success',
            message: 'Role fetched successfully',
            data: roles
        });
    }
    catch(err){
        console.error('Error in getRole:', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        });
    }
}

exports.deleteRole = async(req, res) => {
    try{
        const { userId, role } = req.params;
        const userIdNumber = Number(userId);
        // ตรวจสอบ user
        const userCheck = await checkUser(userIdNumber);
        if(userCheck.status === 'error') {
            return res.status(userCheck.code).json({
                status: 'error',
                message: userCheck.message
            })
        }

        // ตรวจสอบว่ามี role นี้หรือไม่
        const roleCheck = await prisma.userRole.findFirst({
            where: {
                userId: userIdNumber,
                role: role
            }
        });

        

        if (!roleCheck) {
            return res.status(404).json({
                status: 'error',
                message: 'Role not found for this user'
            });
        }

        // // ลบ role
        await prisma.userRole.delete({
            where: {
                id: roleCheck.id
            }
        });

        return res.status(200).json({
            status: 'success',
            message: 'Role deleted successfully'
        });

    }
    catch(err){
        console.error('Error in deleteRole:', err);
        return res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        });
    }
}