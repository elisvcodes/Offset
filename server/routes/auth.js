const express = require('express');
const router = express.Router();
const { logIn, logOut } = require('../controller/auth');
const { auth } = require('../middleware/auth');

router.post('/logout', auth, logOut);
router.post('/login', logIn);
module.exports = router;
