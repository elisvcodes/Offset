import React from 'react';
import { Container, Row, Col, Card, Table } from 'react-bootstrap';
import Layout from '../../components/Layout/index';
import profilePic from '../../media/1_PgIo7r6qQXem8BmWd-vksQ.jpeg';
export default function Profile() {
  return (
    <>
      <Layout>
        <Container className="mt-5">
          <Row>
            <Col sm={4}>
              <Card style={{ width: '18rem' }}>
                <Card.Img variant="top" src={profilePic} />
                <Card.Body>
                  <Card.Title>Susen Reid</Card.Title>
                  <Card.Text>
                    LEVEL: Gold
                    <br /> Some quick example text to build on the card title
                    and make up the bulk of the card's content.
                  </Card.Text>
                </Card.Body>
              </Card>
            </Col>
            <Col sm={8}>
              <Table striped bordered hover>
                <thead>
                  <tr>
                    <th>Item</th>
                    <th>Tracking Since</th>
                    <th>CO2 Preserved</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <td colSpan="2">Larry the Bird</td>
                    <td>@twitter</td>
                  </tr>
                </tbody>
              </Table>
            </Col>
          </Row>
        </Container>
      </Layout>
    </>
  );
}
