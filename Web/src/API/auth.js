import axios from 'axios';

axios.interceptors.request.use((req) => {
  if (localStorage.getItem('profile')) {
    req.headers.authorization = `Bearer ${
      JSON.parse(localStorage.getItem('profile')).token
    }`;
  }
  return req;
});

const url = 'https://hackathon-app.server.elisv.com/auth';

export const signUp = (data) =>
  axios.post(`https://hackathon-app.server.elisv.com/users`, data);

export const login = (data) => {
  return axios.post(`${url}/login`, data);
};

export const logout = () => {
  return axios.post(`${url}/logout`);
};
