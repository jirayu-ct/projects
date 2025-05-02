const express = require('express');
const morgan = require('morgan');
const { readdirSync } = require('fs');
const cors = require('cors');
require('dotenv').config()

const app = express();
const PORT = process.env.PORT;

// const authRouter = require('./routes/auth');
// const categoryRouter = require('./routes/category');

app.use(morgan('dev'));
app.use(express.json({limit: '50mb'}));
app.use(cors())


readdirSync('./routes').map((c) => app.use('/api', require('./routes/' + c)))


//start server
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});