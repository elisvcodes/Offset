import React from 'react';
import { Navbar, Nav, Container } from 'react-bootstrap';
import { logout } from '../../_Actions/auth';
import { useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux';
export default function Navigation(props) {
  const { user, setUser } = props;
  const dispatch = useDispatch();
  const history = useHistory();
  return (
    <>
      <Navbar style={{ background: '#5DB075', color: '#fff' }}>
        <Container>
          <Navbar.Brand href='/'>Offset</Navbar.Brand>
          <Nav className='mr-auto'>
            <Nav.Link href='/products'>Compare</Nav.Link>
          </Nav>
          <Nav>
            {user?.result ? (
              <>
                <Nav.Link href={`/profile`}>Profile</Nav.Link>

                <Nav.Link
                  onClick={() => {
                    dispatch(logout(history));
                    setUser(null);
                  }}
                >
                  Logout
                </Nav.Link>
              </>
            ) : (
              <>
                <Nav.Link href='/login'>Login</Nav.Link>

                <Nav.Link href='/signup'>Sign Up</Nav.Link>
              </>
            )}
          </Nav>
        </Container>
      </Navbar>
    </>
  );
}
