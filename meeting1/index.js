const express = require('express')
const PORT = 8000

const app = express()
app.use(express.json())

let data = {
    users: [
        {
            id: 1,
            name: "Nadhif",
            email: "nadhif@mail.com",
            password: "12345",
            role: "user"
        },
        {
            id: 2,
            name: "Rafi",
            email: "rafi@mail.com",
            password: "54321",
            role: "user"
        }
    ]
}

app.get('/', (request, response) => {
    response.status(200).send("<h1>IM HOME</h1>")
})

// http://localhost:8000/user/register POST
app.post('/user/register', (request, response) => {
    let users = data.users
    users.push({ ...request.body, id: users[users.length - 1].id + 1 })
    response.status(200).send(data.users)
})
// http://localhost:8000/users/ GET
app.get('/users', (request, response) => {
    response.status(200).send(data.users)
})

//  http://localhost:8000/users/delete/1 DELETE
app.delete('/users/delete/:id', (request, response) => {
    const idParams = parseInt(request.params.id)
    let users = data.users

    let exist = false
    users.forEach((user) => {
        if (user.id === idParams) {
            exist = true
        }
    })

    if (exist) {
        const newData = users.filter((user => {
            return user.id !== idParams
        }))
        data.users = newData
        response.status(200).send({ isSuccess: true, message: "Data is deleted" })
    } else {
        response.status(200).send({ isSuccess: false, message: "Data is not exist" })
    }
})

app.put('/users/edit/:id', (request, response) => {
    const idParams = parseInt(request.params.id)
    const users = data.users
    let selectedDataIndex = null

    users.forEach((user, index) => {
        if (user.id === idParams) {
            selectedDataIndex = index
            data.users[index] = { ...data.users[index], ...request.body }
        }
    })

    if (selectedDataIndex) {
        response.status(200).send({ isSuccess: true, data: data.users[selectedDataIndex] })
    } else {
        response.status(500).send({ isSuccess: false })
    }
})

app.patch('/users/edit/:id', (request, response) => {
    const idParams = parseInt(request.params.id)
    const users = data.users
    let selectedDataIndex = null

    users.forEach((user, index) => {
        if (user.id === idParams) {
            selectedDataIndex = index
            data.users[index] = { ...data.users[index], ...request.body }
        }
    })

    if (selectedDataIndex) {
        response.status(200).send({ isSuccess: true, data: data.users[selectedDataIndex] })
    } else {
        response.status(500).send({ isSuccess: false })
    }
})




app.listen(PORT, () => {
    console.log('Start in PORT ' + PORT)
})























// VANILLA NODE JS
// const http = require('http')
// const port = 8000

// let data = {
//     users: [
//         {
//             id: 1,
//             name: "Nadhif",
//             email: "nadhif@mail.com",
//             password: "12345",
//             role: "user"
//         },
//         {
//             id: 2,
//             name: "Rafi",
//             email: "rafi@mail.com",
//             password: "54321",
//             role: "user"
//         }
//     ]
// }

// const server = http.createServer((request, response) => {
//     console.log(request.url)
//     console.log(request.method)

//     if (request.url == '/') {
//         if (request.method == 'GET') {
//             // HEAD : metadata dari response kita (authentication, cors policy)
//             // BODY : data response
//             response.writeHead(200, { "Content-Type": "text/html" })
//             response.end("<h1>Im here</h1>")
//         }
//     } else if (request.url == '/users') {
//         if (request.method == 'GET') {
//             response.writeHead(200, { "Content-Type": "application/json" })
//             response.end(JSON.stringify(data.users))
//         } else if (request.method == 'POST') {

//         } else if (request.method == 'DELETE') {

//         }
//     }

// })

// server.listen(port, () => {
//     console.log("API IS RUNNING ON PORT 8000")
// })