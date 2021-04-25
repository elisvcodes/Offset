const express = require('express');
const router = express.Router();
const { logIn, logOut } = require('../controller/auth');
const auth = require('../middleware/auth');

router.post('/login', logIn);
router.post('/logout', auth, logOut);
module.exports = router;
