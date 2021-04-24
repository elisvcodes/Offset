import axios from 'axios';

export const getProducts = () =>
  axios.get(
    'https://descartable-server-default-rtdb.firebaseio.com/items.json'
  );
