import React, { useState, useEffect } from 'react';
import Navigation from '../Navbar';
export default function Layout(props) {
  const [user, setUser] = useState(JSON.parse(localStorage.getItem('profile')));
  useEffect(() => {
    if (localStorage.getItem('profile')) {
      setUser(JSON.parse(localStorage.getItem('profile')));
    } else {
      setUser(null);
    }
  }, []);
  return (
    <>
      <Navigation user={user} setUser={setUser} />
    {props.children}
    </>
  );
}
