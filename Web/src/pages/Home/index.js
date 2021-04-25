import React from 'react';
import Layout from '../../components/Layout/index';
import { Container, Jumbotron, Nav } from 'react-bootstrap';
import Button from '../../components/UI/Buttons/index';
export default function Home() {
  return (
    <Layout>
      <Jumbotron style={{ background: '#fff' }} className="text-center ">
        <Container>
          <h1 className="mt-3 mb-3">OffSet!</h1>
          <p>
            Compare items with green alternatives and see how you can save our
            home planet for the future generations!
          </p>
          <p>
            <Nav.Link bsPrefix href="/products" target="_blank">
              <Button text="Compare" />
            </Nav.Link>
          </p>
        </Container>
      </Jumbotron>
    </Layout>
  );
}
