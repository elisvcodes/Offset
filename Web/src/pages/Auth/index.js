import React, { useState } from 'react';
import { Form, Container } from 'react-bootstrap';
import Layout from '../../components/Layout';
import Input from '../../components/UI/Forms/Inputs/index';
import Button from '../../components/UI/Buttons/index';
export default function Auth(props) {
  const { match } = props;
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
    console.log(input);
  };

  return (
    <>
      <Layout>
        <Container>
          <Form className="mt-5" onSubmit={onSubmit}>
            {isJoin && (
              <Input
                name="fullName"
                value={input.fullName}
                placeholder="Full Name"
                onChange={onChange}
                label="Your Full Name"
              />
            )}
            <Input
              name="email"
              placeholder="Email"
              value={input.email}
              onChange={onChange}
              label="Email"
            />
            <Input
              name="password"
              placeholder="password"
              value={input.password}
              onChange={onChange}
              label="Password"
            />
            <Button text={isJoin ? 'Sign Up' : 'Login'} type="submit" />
          </Form>
        </Container>
      </Layout>
    </>
  );
}
