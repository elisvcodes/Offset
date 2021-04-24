import React from 'react';
import { Container, Row, Col } from 'react-bootstrap';
import Layout from '../../components/Layout/index';
export default function Profile() {
  return (
    <>
      <Layout>
        <Container className="mt-5">
          <Row>
            <Col>
              <div></div>
            </Col>
            <Col>
              <h2> Items I am tracking</h2>
            </Col>
          </Row>
        </Container>
      </Layout>
    </>
  );
}
