const { response } = require('express')
const express = require('express')
const PORT = 8000
const app = express()
const { db } = require('./database')
const cors = require('cors')

app.use(cors())

app.use(express.json())

app.get('/users', async (req, res) => {
    let fetchQuery = 'SELECT * FROM users'
    db.query(fetchQuery, (err, result) => {
        return res.status(200).send(result)
    })
})

app.listen(PORT, () => {
    console.log("SERVER IS RUNNING ON PORT " + PORT)
})