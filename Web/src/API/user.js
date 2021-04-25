import axios from 'axios';

axios.interceptors.request.use((req) => {
  if (localStorage.getItem('profile')) {
    req.headers.authorization = `Bearer ${
      JSON.parse(localStorage.getItem('profile')).token
    }`;
  }
  return req;
});

export const getSingleUser = (id) =>
  axios.get(`https://hackathon-app.server.elisv.com/users/${id}`);
