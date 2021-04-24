export default (products = [], action) => {
  switch (action.type) {
    case 'GET_PRODUCTS':
      return action.payload;
    default:
      return products;
  }
};
