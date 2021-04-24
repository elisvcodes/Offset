import React from 'react';
import Navigation from '../Navbar';
export default function Layout(props) {
  return (
    <>
      <Navigation />
      {props.children}
    </>
  );
}
