import * as API from '../API/products';

export const getProducts = () => async (dispatch) => {
  const { data } = await API.getProducts();
  dispatch({ type: 'GET_PRODUCTS', payload: data });
};
