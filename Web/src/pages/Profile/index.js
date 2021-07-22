import React, { useEffect } from 'react';
import { Container, Row, Col, Card, Table } from 'react-bootstrap';
import Layout from '../../components/Layout/index';
import { useSelector, useDispatch } from 'react-redux';
import { Link } from 'react-router-dom';
export default function Profile(props) {
  const savedItems = useSelector((state) => state.savedProducts);
  return (
    <>
      <Layout>
        <Container className='mt-5'>
          <Row>
            <Col sm={12}>
              <h1> Saved Items</h1>

              <Table striped bordered hover>
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>description</th>
                    <th>Green?</th>
                    <th>Resuable?</th>
                    <th>Lifespan(Months)</th>
                  </tr>
                </thead>
                <tbody>
                  {savedItems.length !== 0 ? (
                    savedItems.map((item) => {
                      return (
                        <tr key={item._id}>
                          <td>
                            <Link to={`/product/${item.id}`}>{item.title}</Link>
                          </td>
                          <td>{item.description}</td>
                          <td>{item.is_green === true ? 'Yes' : 'No'}</td>
                          <td>{item.is_reusable === true ? 'Yes' : 'No'}</td>
                          <td>{item.lifespam}</td>
                        </tr>
                      );
                    })
                  ) : (
                    <tr>
                      <td>Nothing saved</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  )}
                </tbody>
              </Table>
            </Col>
          </Row>
        </Container>
      </Layout>
    </>
  );
}
