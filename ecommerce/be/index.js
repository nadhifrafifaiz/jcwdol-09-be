const { response } = require('express')

const express = require('express')
const app = express()
const { db } = require('./database')
const { authRoutes } = require('./routes')
const cors = require('cors')
app.use(cors())
require("dotenv").config();

app.use(express.json())
const PORT = process.env.PORT

// app.get('/users', async (req, res) => {
//     let fetchQuery = 'SELECT * FROM users'
//     db.query(fetchQuery, (err, result) => {
//         return res.status(200).send(result)
//     })
// })

app.use('/auth', authRoutes)



app.listen(PORT, () => {
    console.log("SERVER IS RUNNING ON PORT " + PORT)
})