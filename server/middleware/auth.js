const jwt = require('jsonwebtoken');
const User = require('../models/user');
const auth = async (req, res, next) => {
  try {
    if (req.headers.authorization === undefined) {
      throw 'Sorry, you are not authorized to view this page';
    }
    const token = req.headers.authorization.replace('Bearer ', '');
    const decoded = jwt.verify(token, 'hello');
    const user = await User.findOne({
      _id: decoded._id,
      'tokens.token': token,
    });
    req.user = user;
    req.token = token;
    next();
  } catch (error) {
    console.log(error);
    res.status(401).json(error);
  }
};

module.exports = auth;
