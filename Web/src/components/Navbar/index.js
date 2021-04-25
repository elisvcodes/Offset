import React from 'react';
import { Navbar, Nav, Container } from 'react-bootstrap';
export default function Navigation() {
  return (
    <>
      <Navbar style={{ background: '#5DB075', color: '#fff' }}>
        <Container>
          <Navbar.Brand href="/">Offset</Navbar.Brand>
          <Nav>
            <Nav.Link href="/login">Login</Nav.Link>
            <Nav.Link href="/signup">Sign Up</Nav.Link>
          </Nav>
        </Container>
      </Navbar>
    </>
  );
}
