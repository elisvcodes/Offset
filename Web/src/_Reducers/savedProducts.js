export default (savedProducts = [], action) => {
  switch (action.type) {
    case 'SAVED_ITEMS':
      return action.payload;
    default:
      return savedProducts;
  }
};
