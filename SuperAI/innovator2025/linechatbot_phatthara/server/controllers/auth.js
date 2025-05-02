const prisma = require('../config/prisma');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { Role } = require('@prisma/client');

exports.register = async (req, res) => {
    //code
    try {
        //code
        const {
            username,
            password,
            email,
            firstName,
            lastName,
            birthDate,
            gender,
            address,
            phone
        } = req.body;

        if (!username || !password || !email) {
            return res.status(400).json({
                status: 'error',
                message: 'Please fill in all required fields: username, password, email, and role.'
            });
        }

        //check Role
        // const allRoles = Object.values(Role);
        // if (!allRoles.includes(role)) {
        //     return res.status(400).json({
        //         status: 'error',
        //         message: `Invalid role provided. Allowed roles are: ${allRoles.join(', ')}.`
        //     });
        // }

        //check username and email in database
        const existingUser = await prisma.user.findFirst({
            where: {
                OR: [
                    { username: username },
                    { email: email }
                ]
            }
        });

        if (existingUser) {
            return res.status(400).json({
                status: 'error',
                message: 'The username or email is already in use. Please try a different one.'
            });
        }

        //hash password
        const hashPassword = await bcrypt.hash(password, 10);

        //create user
        await prisma.user.create({
            data: {
                username,
                password: hashPassword,
                email,
                firstName,
                lastName,
                birthDate: new Date(birthDate),
                gender,
                address,
                phone
            }
        })

        res.json({
            status: 'success',
            message: "Registration completed successfully!",
            data: {
                username,
                email
            }
        })

    }
    catch (err) {
        //error
        console.log('Register: ', err);
        res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        });
    }
}


exports.login = async (req, res) => {
    try {
        const { username, password } = req.body;
        const user = await prisma.user.findFirst({
            where: {
                username: username
            }
        })
        console.log("user: ", user);

        //check if user exists
        if (!user) return res.status(400).json({
            status: 'error',
            message: 'Invalid username or password.'
        })

        //check password
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({
            status: 'error',
            message: 'Invalid username or password.'
        })

        //check role
        // const userRole = await prisma.userRole.findMany({
        //     where: {
        //         userId: user.id
        //     },
        //     select: {
        //         role: true
        //     }
        // })

        // const allRoles = userRole.reduce((acc, role) => {
        //     acc[role.role] = role.role;
        //     return acc;
        // }, {})

        //create token
        const payload = {
            id: user.id,
            username: user.username,
            email: user.email
            // role: allRoles
        }

        jwt.sign(payload, process.env.JWT_SECRET, {
            expiresIn: '1d'
        }, (err, token) => {
            if (err) return res.status(500).json({
                status: 'error',
                message: 'Error generating token. Please try again later.'
            })
            res.json({
                status: 'success',
                message: 'Login successful!',
                payload: payload,
                token: token
            })
        })
    }
    catch (err) {
        console.error('Login Error:', err);
        res.status(500).json({
            status: 'error',
            message: 'An unexpected error occurred. Please try again later.'
        });
    }
}