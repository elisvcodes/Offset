const express = require('express');
const router = express.Router();
const { auth } = require('../middleware/auth');

const {
  getAllItems,
  getSingleItem,
  getSavedItems,
  saveItem,
} = require('../controller/items');

router.get('/', getAllItems);
router.get('/saved', auth, getSavedItems);
router.post('/save/:id', auth, saveItem);
router.get('/:id', getSingleItem);
module.exports = router;
