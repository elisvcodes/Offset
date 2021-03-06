const User = require('../models/user');

exports.createUser = async (req, res) => {
  try {
    const user = new User(req.body);
    await user.save();
    user.generateToken();
    const token = user.tokens[user.tokens.length - 1].token;
    res.status(201).json({ result: user, token });
  } catch (error) {
    res.status(500).json(error);
  }
};

exports.getUserProfile = (req, res) => {
  User.findOne({ _id: req.user._id }).exec((err, user) => {
    if (err) return res.status(404).json({ msg: 'user was not found' });
    return res.status(200).json(user);
  });
};
