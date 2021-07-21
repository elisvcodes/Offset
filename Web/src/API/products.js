import axios from 'axios';

axios.interceptors.request.use((req) => {
  if (localStorage.getItem('profile')) {
    req.headers.authorization = `Bearer ${
      JSON.parse(localStorage.getItem('profile')).token
    }`;
  }
  return req;
});

export const getProducts = () =>
  axios.get('https://hackathon-app.server.elisv.com/items/');

export const getSingleProduct = (id) =>
  axios.get(`https://hackathon-app.server.elisv.com/items/${id}`);

export const getSavedProducts = () =>
  axios.get(`https://hackathon-app.server.elisv.com/items/saved`);

export const saveItem = (data) =>
  axios.post(`https://hackathon-app.server.elisv.com/items/save/${data}`);
