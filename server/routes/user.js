const express = require('express');
const router = express.Router();
const { auth } = require('../middleware/auth');

const { createUser, getUserProfile } = require('../controller/user');

// router.get('/:id', getSingleUser);
router.post('/', createUser);
router.get('/profile', auth, getUserProfile);

// router.post('/save', auth, saveItem);

module.exports = router;
