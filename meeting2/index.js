const express = require('express')
const { productRouter, userRouter, cartRouter, priceRouter } = require('./routers/index')
const fs = require('fs')
const PORT = 8000
const app = express()
app.use(express.json())


app.use('/user', userRouter)
app.use('/product', productRouter)
app.use('/cart', cartRouter)

app.use('/price', priceRouter)

app.listen(PORT, () => {
    console.log("IM RUNNING ON PORT " + PORT)
})
