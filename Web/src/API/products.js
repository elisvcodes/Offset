import axios from 'axios';

export const getProducts = () =>
  axios.get('https://hackathon-app.server.elisv.com/items/');

export const getSingleProduct = (id) =>
  axios.get(`https://hackathon-app.server.elisv.com/items/${id}`);
