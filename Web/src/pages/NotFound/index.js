import React from 'react';
import { Container } from 'react-bootstrap';
import { Link } from 'react-router-dom';
import Layout from '../../components/Layout';

export default function NotFound() {
  return (
    <>
      <Layout>
        <Container className="mt-5">
          Page not Found - <Link to={`/`}>Go Back</Link>
        </Container>
      </Layout>
    </>
  );
}
