import React, { useState } from 'react';
import { Form, Container } from 'react-bootstrap';
import Layout from '../../components/Layout';
import Input from '../../components/UI/Forms/Inputs/index';
import Button from '../../components/UI/Buttons/index';
import { useHistory, Redirect } from 'react-router-dom';
import { signUp, login, isLoggedIn } from '../../_Actions/auth';
import { useDispatch, useSelector } from 'react-redux';

export default function Auth(props) {
  const { setUser, match } = props;
  const dispatch = useDispatch();
  const history = useHistory();
  const auth = useSelector((state) => state.auth);
  let isJoin;
  if (match.path === '/signup') {
    isJoin = true;
  } else {
    isJoin = false;
  }

  let [input, setInput] = useState({ fullName: '', email: '', password: '' });

  const onChange = (e) => {
    let { name, value } = e.target;
    setInput({ ...input, [name]: value });
  };

  const onSubmit = (e) => {
    e.preventDefault();
    if (!isJoin) {
      dispatch(login(input, history, setUser));
    } else {
      dispatch(signUp(input, history, setUser));
    }
  };

  if (auth.isLoggedIn) {
    return <Redirect to='/products' />;
  }

  return (
    <>
      <Layout>
        <Container>
          <Form
            className='mt-5'
            onSubmit={onSubmit}
            style={{
              maxWidth: '600px',
              margin: '0 auto',
            }}
          >
            {isJoin && (
              <Input
                type='text'
                name='fullName'
                value={input.fullName}
                placeholder='Full Name'
                onChange={onChange}
                label='Your Full Name'
              />
            )}
            <Input
              type='email'
              name='email'
              placeholder='Email'
              value={input.email}
              onChange={onChange}
              label='Email'
            />
            <Input
              type='password'
              name='password'
              placeholder='password'
              value={input.password}
              onChange={onChange}
              label='Password'
            />
            <Button text={isJoin ? 'Sign Up' : 'Login'} type='submit' />
          </Form>
        </Container>
      </Layout>
    </>
  );
}
