const fs = require('fs')

module.exports = {
    fetchPrice: async (request, response) => {
        // console.log(request.total)
        // const { num1, num2 } = request.body
        response.status(200).send({ total: request.plusOne })
    }

}