import logo from './logo.svg';
import './App.css';
import Axios from 'axios'
import React, { useState, useEffect } from 'react'

function App() {

  const [users, setUsers] = useState([])

  const fetchUsers = async () => {
    let result = await Axios.get('http://localhost:8000/users',)
    setUsers(result.data)
  }

  const renderUsers = () => {
    return users.map((user) => {
      return (
        <div>
          <p>{user.name}</p>
          <p>{user.email}</p>
          <p>{user.password}</p>
        </div>
      )
    })
  }

  useEffect(() => {
    fetchUsers()
  }, [])



  return (
    <div className="App">
      <p>Users</p>
      <div>
        {renderUsers()}
      </div>
    </div>
  );
}

export default App;
