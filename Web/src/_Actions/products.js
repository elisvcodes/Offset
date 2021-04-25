import * as API from '../API/products';

export const getProducts = () => async (dispatch) => {
  const { data } = await API.getProducts();
  dispatch({ type: 'GET_PRODUCTS', payload: data });
};

export const getSingleProduct = (id) => async (dispatch) => {
  const { data } = await API.getSingleProduct(id);
  dispatch({ type: 'GET_PRODUCT', payload: data });
};
