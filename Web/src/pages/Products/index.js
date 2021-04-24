import React, { useEffect } from 'react';
import { Container, Card, Row, Col } from 'react-bootstrap';
import { useDispatch, useSelector } from 'react-redux';
import Layout from '../../components/Layout';
import { getProducts } from '../../_Actions/products';
import Button from '../../components/UI/Buttons/index';
import { ImPriceTags } from 'react-icons/im';
import { GiGasMask, GiLifeBar } from 'react-icons/gi';

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
                    <Col sm={4}>
                      <Card className="mb-5">
                        <Card.Img
                          variant="top"
                          src={products[product].image_url}
                          style={{ height: '50vh', objectFit: 'contain' }}
                        />
                        <Card.Body>
                          <Card.Title>Card Title</Card.Title>
                          <Card.Text>
                            Some quick example text to build on the card title
                            and make up the bulk of the card's content.
                          </Card.Text>
                          <p>
                            <ImPriceTags />{' '}
                            {`Price: $${products[product].price}`}
                          </p>
                          <p>
                            <GiGasMask /> Degrades in:{' '}
                            {`${products[product].bio_time} Years`}
                          </p>
                          <p>
                            <GiLifeBar />{' '}
                            {`Life Span ~ ${products[product].lifespam} Months`}
                          </p>
                          <Button text="Compare" />
                        </Card.Body>
                      </Card>
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
