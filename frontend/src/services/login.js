import axios from 'axios'
const baseUrl = 'http://localhost:3003'
const loginUrl = baseUrl + '/api/login'
//const loginUrl = 'http://localhost:3003/api/login'


const login = async credentials => {
  const response = await axios.post(loginUrl, credentials)
  return response.data
}

export default { login }