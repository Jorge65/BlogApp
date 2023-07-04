import axios from 'axios'
const baseUrl = 'http://localhost:3003'
const blogUrl = baseUrl + '/api/blogs'
//const blogUrl = 'http://localhost:3003/api/blogs'

let token = null

const setToken = newToken => {
  token = `Bearer ${newToken}`
}

const getAll = () => {
  const request = axios.get(blogUrl)
  return request.then(response => response.data)
}

const create = async newObject => {
  const config = {
    headers: { Authorization: token },
  }

  const response = await axios.post(blogUrl, newObject, config)
  return response.data
}

const remove = (id) => {
  const config = {
    headers: { Authorization: token },
  }
  const request = axios.delete(`${ blogUrl }/${id}`, config)
  return request.then(response => response.data)
}

const update = (id, newObject) => {
  const request = axios.put(`${ blogUrl }/${id}`, newObject)
  return request.then(response => response.data)
}


export default { getAll, create, update, remove, setToken }


