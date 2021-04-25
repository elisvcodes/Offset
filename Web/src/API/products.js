import axios from 'axios';

export const getProducts = () =>
  axios.get(
    'https://descartable-server-default-rtdb.firebaseio.com/items.json'
  );

export const getSingleProduct = (id) =>
  axios.get(
    `https://descartable-server-default-rtdb.firebaseio.com/items/${id}.json`
  );
