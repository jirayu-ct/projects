const { Role } = require('@prisma/client');
const allRoles = Object.values(Role).reduce((acc, role) => {
    acc[role] = role;
    return acc;
}, {})

exports.role = allRoles;