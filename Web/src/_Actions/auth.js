import * as API from '../API/auth';

export const signUp = (user, history, setUser) => async (dispatch) => {
  const { status, data } = await API.signUp(user);
  if (localStorage.getItem('profile')) {
    dispatch({ type: 'isLoggedIn', payload: false });
  } else if (status == 200) {
    dispatch({ type: 'AUTH', payload: data });
    // setUser(data);
  }
  // history.push(`/profile`);
};

export const login = (creds, history, setUser) => async (dispatch) => {
  const { status, data } = await API.login(creds);
  if (localStorage.getItem('profile')) {
    dispatch({ type: 'isLoggedIn', payload: false });
  } else if (status == 200) {
    dispatch({ type: 'AUTH', payload: data });
    // setUser(data);
  }
  // history.push(`/profile`);
};

export const isLoggedIn = () => async (dispatch) => {
  if (localStorage.getItem('profile')) {
    dispatch({ type: 'isLoggedIn', payload: true });
  } else {
    dispatch({ type: 'isLoggedIn', payload: false });
  }
};

export const logout = (history) => async (dispatch) => {
  const { data } = await API.logout();
  dispatch({ type: 'LOGOUT', payload: data });
  history.push('/login');
};
