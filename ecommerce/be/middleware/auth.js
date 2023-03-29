const jwt = require('jsonwebtoken')

const verifyToken = (req, res, next) => {
    let token = req.headers.authorization
    if (!token) {
        return res.status(401).send('Access denied')
    }

    token = token.split(' ')[1]
    if (token === 'null' || !token) {
        return res.status(401).send('Access denied')
    }

    let verifiedUser = jwt.verify(token, 'nadhif')
    if (!verifiedUser) {
        return res.status(401).send('Access denied')
    }

    req.user = verifiedUser
    console.log(verifiedUser)
    next()
}

const checkRole = async (req, res, next) => {
    if (req.user.isAdmin) {
        return next()
    }
    return res.status(401).send('Access denied karena dia bukan admin')
}




module.exports = { verifyToken, checkRole }