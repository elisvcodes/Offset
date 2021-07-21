const express = require('express');
const router = express.Router();
const {
  getAllItems,
  getSingleItem,
  getSavedItems,
} = require('../controller/items');
const auth = require('../middleware/auth');

router.get('/', getAllItems);
router.get('/:id', getSingleItem);
router.get('/saved', auth, getSavedItems);
module.exports = router;
