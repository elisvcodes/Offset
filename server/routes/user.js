const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');

const {
  getSingleUser,
  createUser,
  getUserProfile,
} = require('../controller/user');
const { saveItem } = require('../controller/items');
router.get('/:id', getSingleUser);
router.post('/', createUser);
router.post('/profile', auth, getUserProfile);

router.post('/save', auth, saveItem);

module.exports = router;
