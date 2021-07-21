import { combineReducers } from 'redux';
import products from './products';
import product from './product';
import auth from './auth';
import savedProducts from './savedProducts';

export default combineReducers({
  products,
  product,
  savedProducts,
  auth,
});
