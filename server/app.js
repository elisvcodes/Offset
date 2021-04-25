const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors());

app.use(express.json());
let PORT = process.env.PORT || 1000;

require('./db/db');

app.use('/items', require('./routes/item'));
app.use('/users', require('./routes/user'));
app.use('/auth', require('./routes/auth'));
app.listen(PORT);
