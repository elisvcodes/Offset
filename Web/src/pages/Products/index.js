import React, { useEffect } from 'react';
import { Container, Card, Row, Col } from 'react-bootstrap';
import { useDispatch, useSelector } from 'react-redux';
import Layout from '../../components/Layout';
import { getProducts } from '../../_Actions/products';

import SingleProduct from './SingleProduct';

export default function Products() {
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(getProducts());
  }, [dispatch]);
  const products = useSelector((state) => state.products);

  return (
    <>
      <Layout>
        <Container className="mt-5 mb-5">
          {products ? (
            <>
              <Row className="mt-5">
                {Object.keys(products).map((product, index) => {
                  return (
                    <Col xs={12} sm={4} key={product}>
                      <SingleProduct product={products[product]} />
                    </Col>
                  );
                })}
              </Row>
            </>
          ) : (
            <Card>
              <Card.Body>
                <Card.Text>No Products Were Found!</Card.Text>
              </Card.Body>
            </Card>
          )}
        </Container>
      </Layout>
    </>
  );
}
