const prisma = require("../config/prisma");
exports.create = async (req, res) => {
    //code
    try {
        //code
        const { name } = req.body;
        const catagory = await prisma.category.create({
            data: {
                name: name
            }
        })
        res.json({
            message: 'Category created successfully',
            category: catagory
        });

    } catch (err) {
        //error
        console.log(err);
        res.status(500).json({
            message: 'An unexpected error occurred. Please try again later.'
        });
    }
}



exports.list = async (req, res) => {
    //code
    try {
        //code
        const category = await prisma.category.findMany()

        res.json({
            status: 'success',
            message: "Category list successful!",
            category: category
        })
    } catch (err) {
        //error
        console.log(err);
        res.status(500).json({
            message: 'An unexpected error occurred. Please try again later.'
        });
    }
}


exports.remove = async (req, res) => {
    //code
    try {
        //code
        // const { id } = req.params;
        // const category = await prisma.category.delete({
        //     where: {
        //         id: Number(id)
        //     }
        // })

        res.send("category deleted successfully");
    } catch (err) {
        //error
        console.log(err);
        res.status(500).json({
            message: 'An unexpected error occurred. Please try again later.'
        });
    }
}