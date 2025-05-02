const prisma = require("../config/prisma");

const checkUser = async (userId) => {
    try {
        const user = await prisma.user.findUnique({
            where: {
                id: userId
            }
        });

        if (!user) {
            return {
                status: 'error',
                message: 'User not found',
                code: 404
            };
        }

        return {
            status: 'success',
            data: user
        };
    } catch (error) {
        console.error('Error in checkUser:', error);
        return {
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.',
            code: 500
        };
    }
};

module.exports = { checkUser };