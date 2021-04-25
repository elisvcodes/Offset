import React, { useEffect } from 'react';
import Layout from '../../../components/Layout';
import { getSingleProduct, getProducts } from '../../../_Actions/products';
import SingleProduct from '../SingleProduct';
import { useDispatch, useSelector } from 'react-redux';
import { Card, Col, Container, Row } from 'react-bootstrap';
import { Bar } from 'react-chartjs-2';
import { Link } from 'react-router-dom';
export default function SingleProductDashboard(props) {
  let id = props.match.params.id;
  const dispatch = useDispatch();
  useEffect(() => {
    dispatch(getSingleProduct(id));
    dispatch(getProducts());
  }, [dispatch]);
  const product = useSelector((state) => state.product);
  const products = useSelector((state) => state.products);
  console.log(product);
  let itemTitle = [];
  let itemPrice = [];
  let itemLifespan = [];
  let bioTime = [];
  let carbonReleased = [];
  Object.keys(products).forEach((pro) => {
    if (products[pro].item_category === product.item_category) {
      itemTitle.push(products[pro].title);
      itemPrice.push(products[pro].price);
      itemLifespan.push(products[pro].lifespam);
      bioTime.push(products[pro].bio_time);
      carbonReleased.push(products[pro].carbon);
    }
  });
  console.log(itemTitle);
  console.log(itemPrice);
  console.log(itemLifespan);
  console.log(bioTime);
  console.log(carbonReleased);

  const data = {
    labels: itemTitle,
    datasets: [
      {
        label: 'Cost Per Single Item',
        data: itemPrice,
        backgroundColor: 'rgb(255, 99, 132)',
      },
      {
        label: 'Longevity (Months)',
        data: itemLifespan,
        backgroundColor: 'rgb(54, 162, 235)',
      },
      {
        label: 'Carbon Release (Grams)',
        data: carbonReleased,
        backgroundColor: 'rgb(75, 192, 192)',
      },
    ],
  };

  const options = {
    scales: {
      yAxes: [
        {
          ticks: {
            beginAtZero: true,
          },
        },
      ],
    },
  };
  return (
    <>
      <Layout>
        <Container className="mt-5">
          <Link to={`/products`}> Go Back</Link>

          <Row>
            <Col sm={4} className="mr-5">
              {Object.keys(product).length > 0 ? (
                <SingleProduct product={product} />
              ) : (
                'No Such Product was Found'
              )}
            </Col>
            <Col sm={7}>
              <Bar
                data={data}
                options={(options, { maintainAspectRatio: false })}
              />
            </Col>
          </Row>
        </Container>
        <Container className="mt-5">
          <h3> Alternatives</h3>
          <Row>
            {Object.keys(products).map((pro) => {
              return products[pro].item_category === product.item_category ? (
                <Col xs={12} sm={3} key={product}>
                  <SingleProduct product={products[pro]} />
                </Col>
              ) : (
                ''
              );
            })}
          </Row>
        </Container>
      </Layout>
    </>
  );
}
