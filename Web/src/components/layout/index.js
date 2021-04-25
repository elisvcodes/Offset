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
<<<<<<< HEAD
      {props.children}
=======
//       {React.cloneElement(props.children, { user: user })}
          {props.children}
>>>>>>> 69d3b9330dd24bdcba6fcf4a86add63013345323
    </>
  );
}
