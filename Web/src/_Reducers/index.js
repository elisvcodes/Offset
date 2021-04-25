import { combineReducers } from 'redux';
import products from './products';
import product from './product';
import auth from './auth';
export default combineReducers({
  products,
  product,
  auth,
});
