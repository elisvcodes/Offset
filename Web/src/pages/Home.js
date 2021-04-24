import React from 'react';
import Layout from '../components/Layout/index';
import { Container, Jumbotron, Button } from 'react-bootstrap';
export default function Home() {
  return (
    <Layout>
      <Jumbotron style={{ background: '#f8f9fa' }} className="text-center">
        <Container>
          <h1>MyCarbo!</h1>
          <p>
            This is a simple hero unit, a simple jumbotron-style component for
            calling extra attention to featured content or information.
          </p>
          <p>
            <Button variant="primary">Learn more</Button>
          </p>
        </Container>
      </Jumbotron>
    </Layout>
  );
}
