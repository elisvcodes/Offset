import React from 'react';
import { Card, Nav } from 'react-bootstrap';
import Button from '../../../components/UI/Buttons';
import { ImPriceTags } from 'react-icons/im';
import { GiGasMask, GiLifeBar } from 'react-icons/gi';

export default function SingleProduct({ product }) {
  let title = product.item_tags.split(',');
  return (
    <>
      <Card className="mb-5">
        <Card.Img
          variant="top"
          src={product.image_url}
          style={{ height: '50vh', objectFit: 'contain' }}
        />
        <Card.Body>
          <Card.Title>
            <Nav.Link bsPrefix href={`/product/${product.id}`}>
              {' '}
              {title}
            </Nav.Link>
          </Card.Title>
          <Card.Text>{product.description}</Card.Text>
          <p>
            <ImPriceTags /> {`Item Price ~ $${product.price}`}
          </p>
          <p>
            <GiGasMask /> {`Degrades in ~ ${product.bio_time} Years`}
          </p>
          <p>
            <GiLifeBar /> {`Life Span ~ ${product.lifespam} Months`}
          </p>
          <Nav.Link bsPrefix href={product.product_link} target="_blank">
            <Button text="Buy" />{' '}
          </Nav.Link>{' '}
          <Button text="Save" />
        </Card.Body>
      </Card>
    </>
  );
}
