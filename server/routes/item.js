const express = require('express');
const router = express.Router();
const { getAllItems, getSingleItem } = require('../controller/items');

router.get('/', getAllItems);
router.get('/:id', getSingleItem);

module.exports = router;
