import React from 'react';
import { Button as Btn } from 'react-bootstrap';
export default function Button({ text, type, onClick }) {
  return (
    <>
      <Btn
        type={type}
        style={{ background: '#5DB075', border: 'none', outline: 'none' }}
        onClick={onClick}
      >
        {text}
      </Btn>
    </>
  );
}
