import React from 'react';
import { Navbar as ReactNavbar } from 'react-bootstrap';
export default function WebsiteNavbar() {
  return (
    <>
      <ReactNavbar bg="light" expand="lg">
        <ReactNavbar.Brand href="#home">React-Bootstrap</ReactNavbar.Brand>
        <ReactNavbar.Toggle aria-controls="basic-navbar-nav" />
        <ReactNavbar.Collapse id="basic-navbar-nav">
          <ReactNavbar className="mr-auto">
            <ReactNavbar.Link href="#home">Home</ReactNavbar.Link>
            <ReactNavbar.Link href="#link">Link</ReactNavbar.Link>
          </ReactNavbar>
        </ReactNavbar.Collapse>
      </ReactNavbar>
    </>
  );
}
