const jwt = require('jsonwebtoken');
const prisma = require('../config/prisma');
const { JWT_SECRET } = process.env;


exports.verifyToken = async (req, res, next) => {
    try {
        const headerToken = req.headers.authorization;

        if (!headerToken) {
            return res.status(401).json({
                status: 'error',
                message: 'Authorization token is missing. Please provide a valid token to access this resource.',
                errorCode: 'TOKEN_MISSING'
            });
        }

        const token = headerToken.split(' ')[1];
        const decoded = jwt.verify(token, JWT_SECRET);

        req.user = decoded;

        const user = await prisma.user.findFirst({
            where: {
                username: req.user.username
            }
        });

        if (!user) {
            return res.status(404).json({
                status: 'error',
                message: 'User not found. Please ensure your account exists.',
                errorCode: 'USER_NOT_FOUND'
            });
        }

        if (!user.enabled) {
            return res.status(403).json({
                status: 'error',
                message: 'Your account is currently disabled. Please contact support for assistance.',
                errorCode: 'USER_DISABLED'
            });
        }

        next();

    } catch (err) {
        console.error('Token Verification Error:', err);
        return res.status(500).json({
            status: 'error',
            message: 'An error occurred while verifying your token. Please try again later.',
            errorCode: 'TOKEN_VERIFICATION_ERROR'
        });
    }
};


exports.roleTeacherAndAdmin = async (req, res, next) => {
    try {
        const { id } = req.user;

        // ดึง role ทั้งหมดของ user
        const userRoles = await prisma.userRole.findMany({
            where: {
                userId: id
            },
            select: {
                role: true
            }
        });

        // ตรวจสอบว่ามี role เป็น admin หรือ teacher
        const isAdmin = userRoles.some(ur => ur.role === 'admin');
        const isTeacher = userRoles.some(ur => ur.role === 'teacher');

        // ถ้าเป็น admin หรือเป็นทั้ง admin และ teacher
        if (isAdmin || (isTeacher && isAdmin)) {
            return next();
        }

        return res.status(403).json({
            status: 'error',
            message: 'You are not authorized to access this resource.',
            errorCode: 'UNAUTHORIZED'
        });

    } catch (error) {
        console.error('Role Check Error:', error);
        return res.status(500).json({
            status: 'error',
            message: 'An error occurred while checking roles.',
            errorCode: 'ROLE_CHECK_ERROR'
        });
    }
};

exports.roleTeacher = async(req, res, next) => {
    try {
        const { id } = req.user;

        const userRoles = await prisma.userRole.findMany({
            where: {
                userId: id
            },
            select: {
                role: true
            }
        })

        const isAdmin = userRoles.some(ur => ur.role === 'admin')
        const isTeacher = userRoles.some(ur => ur.role === 'teacher');

        if(isAdmin || isTeacher) {
            return next();
        }

        return res.status(403).json({
            status: 'error',
            message: 'You are not authorized to access this resource.',
            errorCode: 'UNAUTHORIZED'
        });
    }
    catch(err) {
        console.error('Role Teacher Error:', err);
        return res.status(500).json({
            status: 'error',
            message: 'An error occurred while checking roles.',
            errorCode: 'ROLE_CHECK_ERROR'
        });
    }
}
