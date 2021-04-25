import * as API from '../API/auth';

export const signUp = (user, history, setUser) => async (dispatch) => {
  const { data } = await API.signUp(user);
  dispatch({ type: 'AUTH', payload: data });
  setUser(data);
  history.push(`/profile`);
};

export const login = (creds, history, setUser) => async (dispatch) => {
  const { data } = await API.login(creds);
  dispatch({ type: 'AUTH', payload: data });
  setUser(data);
  history.push(`/profile`);
};

export const logout = () => async (dispatch) => {
  const { data } = await API.logout();
  dispatch({ type: 'LOGOUT', payload: data });
};
