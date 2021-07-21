import React from 'react';
import { Redirect, Route } from 'react-router-dom';
export default function PrivateRoute({
  render: Render,
  component: Component,
  ...others
}) {
  return (
    <Route
      {...others}
      render={(props) =>
        localStorage.getItem('profile') ? (
          Render ? (
            Render(props)
          ) : Component ? (
            <Component {...props} />
          ) : null
        ) : (
          <Redirect to='/login' />
        )
      }
    />
  );
}
