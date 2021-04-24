import React from 'react';
import WebsiteNavbar from '../WebsiteNavbar';

export default function Layout(props) {
  return (
    <>
      <WebsiteNavbar />
      {props.children}
    </>
  );
}
