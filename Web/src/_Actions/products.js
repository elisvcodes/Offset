import * as API from '../API/products';

export const getProducts = () => async (dispatch) => {
  const { data } = await API.getProducts();
  dispatch({ type: 'GET_PRODUCTS', payload: data });
};

export const getSingleProduct = (id) => async (dispatch) => {
  const { data } = await API.getSingleProduct(id);
  dispatch({ type: 'GET_PRODUCT', payload: data });
};

export const getSavedProducts = () => async (dispatch) => {
  const { data } = await API.getSavedProducts();
  dispatch({ type: 'SAVED_ITEMS', payload: data });
};

export const saveItem = (id) => async () => {
  await API.saveItem(id);
};
