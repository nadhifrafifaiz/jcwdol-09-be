const { db, query } = require('../database')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

module.exports = {
    register: async (req, res) => {
        const { username, email, name, password } = req.body
        // let getEmailQuery = `SELECT * FROM users WHERE email=${db.escape(email)}`
        // db.query(getEmailQuery, async (err, result) => {
        //     if (result.length > 0) {
        //         return res.status(400).send({ message: 'Email has been used' })
        //     } else {
        //         const salt = await bcrypt.genSalt(10)
        //         const hashPassword = await bcrypt.hash(password, salt)


        //         let addUserQuery = `INSERT INTO users VALUES (null, ${db.escape(username)}, ${db.escape(email)}, ${db.escape(hashPassword)}, ${db.escape(name)}, false)`
        //         db.query(addUserQuery, (err, result) => {
        //             if (err) {
        //                 return res.status(400).send(err)
        //             }
        //             return res.status(200).send({ data: result, message: "Register success" })
        //         })
        //     }
        // })


        let getEmailQuery = `SELECT * FROM users WHERE email=${db.escape(email)}`
        let isEmailExist = await query(getEmailQuery)
        if (isEmailExist.length > 0) {
            return res.status(400).send({ message: 'Email has been used' })
        }

        const salt = await bcrypt.genSalt(10)
        const hashPassword = await bcrypt.hash(password, salt)

        let addUserQuery = `INSERT INTO users VALUES (null, ${db.escape(username)}, ${db.escape(email)}, ${db.escape(hashPassword)}, ${db.escape(name)}, false)`
        let addUserResult = await query(addUserQuery)
        return res.status(200).send({ data: addUserResult, message: "Register success" })
    },
    login: async (req, res) => {
        //ambil user yang emailnya = email dari body
        //cek apakah ada, kalo gaada response email atau password salah
        // kalo ada passwordnya di cek menggunakan bcrypy
        //kalo salah passwordnya, response email atau password salah
        //kalo betul kita akan buatkan token untuk user yang login
        // lalu response

        try {
            const { email, password } = req.body
            const isEmailExist = await query(`SELECT * FROM users WHERE email=${db.escape(email)}`)
            if (isEmailExist.length == 0) {
                return res.status(400).send({ message: "Email or password is invalid" })
            }

            const isValid = await bcrypt.compare(password, isEmailExist[0].password)

            if (!isValid) {
                return res.status(400).send({ message: "Email or password is invalid" })
            }

            let payload = { id: isEmailExist[0].id_users, isAdmin: isEmailExist[0].isAdmin }
            const token = jwt.sign(payload, 'nadhif', { expiresIn: '1h' })

            return res.status(200).send({ token, message: "Login success", dat: isEmailExist })

        } catch (error) {
            res.status(error.statusCode || 500).send(error)
        }
    },
    fetchAllUser: async (req, res) => {
        try {
            const users = await query(`SELECT * FROM users`)
            return res.status(200).send(users)
        } catch (error) {
            return res.status(error.statusCode || 500).send(error)
        }
    },
    fetchUser: async (req, res) => {
        try {
            const idParams = parseInt(req.params.id)
            if (req.user.id !== idParams) {
                return res.status(401).send("gak boleh ambil data bukan punya dia")
            }

            const users = await query(`SELECT * FROM users WHERE id_users = ${db.escape(idParams)}`)
            return res.status(200).send(users)
        } catch (error) {
            return res.status(error.statusCode || 500).send(error)
        }
    }
}