const express = require('express');
const router = express.Router();

const { getSingleUser, createUser } = require('../controller/user');

router.get('/:id', getSingleUser);
router.post('/', createUser);

module.exports = router;
