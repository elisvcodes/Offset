import React, { useState, useEffect } from 'react';
import { Switch, Route } from 'react-router-dom';
import Auth from './pages/Auth';
import Profile from './pages/Profile';
import Home from './pages/Home/index';
import Products from './pages/Products';
import SingleProductDashboard from './pages/Products/SingleProductDashboard';
import NotFound from './pages/NotFound';
import { getSavedProducts } from './_Actions/products';
import { isLoggedIn } from './_Actions/auth';
import { useDispatch, useSelector } from 'react-redux';
import PrivateRoute from './HOF/PrivateRoute';
function App() {
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(isLoggedIn());

    if (localStorage.getItem('profile')) {
      dispatch(getSavedProducts());
    }
  }, [dispatch]);

  return (
    <Switch>
      <Route exact path='/' component={Home} />
      <Route path='/login' render={(props) => <Auth {...props} />} />
      <Route path='/signup' render={(props) => <Auth {...props} />} />
      <PrivateRoute
        path='/profile'
        render={(props) => <Profile {...props} />}
      />
      <Route path='/products' render={(props) => <Products {...props} />} />

      <Route
        path='/product/:id'
        render={(props) => <SingleProductDashboard {...props} />}
      />
      <Route component={NotFound} />
    </Switch>
  );
}

export default App;
