const fs = require('fs')

module.exports = {
    fetchProducts: async (request, response) => {
        let data = JSON.parse(fs.readFileSync('./db.json'))
        response.status(200).send(data.products)
    }
}