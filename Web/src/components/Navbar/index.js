import React from 'react';
import { Navbar, Nav, Container } from 'react-bootstrap';
export default function Navigation() {
  return (
    <>
      <Navbar bg="primary" variant="dark">
        <Container>
          <Navbar.Brand href="/">MyCarbo</Navbar.Brand>
          <Nav>
            <Nav.Link href="/login">Login</Nav.Link>
            <Nav.Link href="/signup">Sign Up</Nav.Link>
          </Nav>
        </Container>
      </Navbar>
    </>
  );
}
