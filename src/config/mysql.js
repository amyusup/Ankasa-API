const mysql = require('mysql')
require('dotenv').config()

const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD || 'zwallet-amy',
    database: process.env.DB_NAME
})

connection.connect((err) => {
    if(!err) {
        console.log('MySQL Connected')
    } else {
        console.log(err)
    }
})

module.exports = connection