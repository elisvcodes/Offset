import React from 'react';
import { Form } from 'react-bootstrap';
export default function Input({ label, type, placeholder, name, onChange }) {
  return (
    <>
      <Form.Group controlId="formBasicEmail">
        <Form.Label>{label}</Form.Label>
        <Form.Control
          name={name}
          type={type}
          onChange={onChange}
          placeholder={placeholder}
        />
      </Form.Group>
    </>
  );
}
