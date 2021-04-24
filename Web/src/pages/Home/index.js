import React from 'react';
import Layout from '../../components/Layout/index';
import { Container, Jumbotron } from 'react-bootstrap';
import Button from '../../components/UI/Buttons/index';
export default function Home() {
  return (
    <Layout>
      <Jumbotron style={{ background: '#f8f9fa' }} className="text-center ">
        <Container>
          <h1 className="mt-3 mb-3">MyCarbo!</h1>
          <p>
            This is a simple hero unit, a simple jumbotron-style component for
            calling extra attention to featured content or information.
          </p>
          <p>
            <Button text="Learn More" />
          </p>
        </Container>
      </Jumbotron>
    </Layout>
  );
}
