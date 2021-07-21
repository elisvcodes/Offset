export default (auth = { authData: null, isLoggedIn: false }, action) => {
  switch (action.type) {
    case 'AUTH':
      localStorage.setItem('profile', JSON.stringify(action.payload));
      return { ...auth, authData: action.payload, isLoggedIn: true };
    case 'isLoggedIn':
      return { ...auth, isLoggedIn: action.payload };
    case 'LOGOUT':
      localStorage.clear();
      return { ...auth, authData: null, isLoggedIn: false };
    default:
      return auth;
  }
};
