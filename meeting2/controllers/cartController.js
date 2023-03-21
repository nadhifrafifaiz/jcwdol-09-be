const fs = require('fs')

module.exports = {
    fetchCarts: async (request, response) => {
        let data = JSON.parse(fs.readFileSync('./db.json'))
        response.status(200).send(data.carts)
    }
}