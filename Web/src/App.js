import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Auth from './pages/Auth';
import Profile from './pages/Profile';
import Home from './pages/Home/index';
import Products from './pages/Products';
import SingleProductDashboard from './pages/Products/SingleProductDashboard';

function App() {
  return (
    <Switch>
      <Route exact path="/" component={Home} />
      <Route path="/login" component={Auth} />
      <Route path="/signup" component={Auth} />
      <Route path="/profile" component={Profile} />
      <Route path="/products" component={Products} />
      <Route
        path="/product/:id"
        render={(props) => <SingleProductDashboard {...props} />}
      />
    </Switch>
  );
}

export default App;
