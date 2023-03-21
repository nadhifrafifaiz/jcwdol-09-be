module.exports = {
    getSum: async (request, response, next) => {
        try {
            const { num1, num2 } = request.body
            request.total = num1 + num2
            next()

        } catch (error) {
            response.status(500).send({ messsage: "CANNOT CONTAIN MINUS", error: error })
        }
    },
    plusOne: (request, response, next) => {
        request.plusOne = request.total + 1
        next()
    }
}