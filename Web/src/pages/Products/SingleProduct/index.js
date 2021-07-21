import React, { useState, useEffect } from 'react';
import { Card, Nav } from 'react-bootstrap';
import Button from '../../../components/UI/Buttons';
import { ImPriceTags } from 'react-icons/im';
import { GiGasMask, GiLifeBar } from 'react-icons/gi';
import { saveItem } from '../../../_Actions/products';
import { useDispatch, useSelector } from 'react-redux';
import { Redirect } from 'react-router-dom';
import { useHistory } from 'react-router';
export default function SingleProduct({ product }) {
  const dispatch = useDispatch();
  const history = useHistory();
  const savedProducts = useSelector((state) => state.savedProducts);
  const auth = useSelector((state) => state.auth);
  let title = product.item_tags.split(',');
  const [saveClick, setSaveClick] = useState(false);
  useEffect(() => {
    savedProducts.forEach((item) =>
      item._id === product._id ? setSaveClick(true) : null
    );
  }, [savedProducts]);
  return (
    <>
      <Card className='mb-5'>
        <Card.Img
          variant='top'
          src={product.image_url}
          style={{ height: '25vh', objectFit: 'contain' }}
        />
        <Card.Body>
          <Card.Title>
            <Nav.Link bsPrefix href={`/product/${product.id}`}>
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
          <Nav.Link bsPrefix href={product.product_link} target='_blank'>
            <Button text='Buy' /> {''}
          </Nav.Link>
          <Button
            text={saveClick ? 'Saved' : 'Save'}
            onClick={() =>
              auth.isLoggedIn
                ? (setSaveClick(!saveClick), dispatch(saveItem(product._id)))
                : history.push('/login')
            }
          />
        </Card.Body>
      </Card>
    </>
  );
}
