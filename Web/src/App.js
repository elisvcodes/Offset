import React from 'react';
import { Switch, Route } from 'react-router-dom';
import Auth from './pages/Auth';
import Profile from './pages/Profile';
import Home from './pages/Home/index';

function App() {
  return (
    <Switch>
      <Route exact path="/" component={Home} />
      <Route path="/login" component={Auth} />
      <Route path="/signup" component={Auth} />
      <Route path="/profile" component={Profile} />
    </Switch>
  );
}

export default App;
