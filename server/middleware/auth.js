const jwt = require('jsonwebtoken');
const User = require('../models/user');

exports.auth = (req, res, next) => {
  if (req.headers.authorization === undefined) {
    throw 'Sorry, you are not authorized to view this page';
  }
  const token = req.headers.authorization.replace('Bearer ', '');
  const decoded = jwt.verify(token, 'hello');
  User.findOne({
    _id: decoded._id,
    'tokens.token': token,
  }).exec((err, user) => {
    if (err) {
      return res.status(400).json('err');
    }
    req.user = user;
    req.token = token;
    next();
  });
};
