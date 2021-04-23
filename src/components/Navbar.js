import React from 'react';
import { Navbar as ReactNavbar } from 'react-bootstrap';
export default function Navbar() {
  return (
    <ReactNavbar bg="light" expand="lg">
      <ReactNavbar.Brand href="#home">React-Bootstrap</ReactNavbar.Brand>
      <ReactNavbar.Toggle aria-controls="basic-navbar-nav" />
      <ReactNavbar.Collapse id="basic-navbar-nav">
        <ReactNavbar className="mr-auto">
          <ReactNavbar.Link href="#home">Home</ReactNavbar.Link>
          <ReactNavbar.Link href="#link">Link</ReactNavbar.Link>
        </ReactNavbar>
        <Form inline>
          <FormControl type="text" placeholder="Search" className="mr-sm-2" />
          <Button variant="outline-success">Search</Button>
        </Form>
      </ReactNavbar.Collapse>
    </ReactNavbar>
  );
}
