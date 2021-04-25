import React, { useState, useEffect } from 'react';
import { Switch, Route } from 'react-router-dom';
import Auth from './pages/Auth';
import Profile from './pages/Profile';
import Home from './pages/Home/index';
import Products from './pages/Products';
import SingleProductDashboard from './pages/Products/SingleProductDashboard';
import NotFound from './pages/NotFound';

function App() {
  const [user, setUser] = useState(JSON.parse(localStorage.getItem('profile')));
  useEffect(() => {
    if (localStorage.getItem('profile')) {
      setUser(JSON.parse(localStorage.getItem('profile')));
    } else {
      setUser(null);
    }
  }, []);
  return (
    <Switch>
      <Route exact path="/" component={Home} />
      <Route
        path="/login"
        render={(props) => <Auth {...props} setUser={setUser} />}
      />
      <Route
        path="/signup"
        render={(props) => <Auth {...props} setUser={setUser} />}
      />
      <Route
        path="/profile"
        render={(props) => (
          <Profile {...props} user={user !== null ? user.result : user} />
        )}
      />
      <Route path="/products" component={Products} />
      <Route
        path="/product/:id"
        render={(props) => <SingleProductDashboard {...props} />}
      />
      <Route component={NotFound} />
    </Switch>
  );
}

export default App;
