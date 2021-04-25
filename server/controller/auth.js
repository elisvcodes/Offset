const User = require('../models/user');

exports.logIn = async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findByEmail(email, password);
    user.generateToken();
    const token = user.tokens[user.tokens.length - 1].token;
    res.status(200).json({ result: user, token });
  } catch (error) {
    res.status(500).json({ error });
  }
};

exports.logOut = async (req, res) => {
  try {
    req.user.tokens = req.user.tokens.filter(
      (token) => token.token !== req.token
    );
    await req.user.save();
    res.status(200).json('logged out!');
  } catch (error) {
    console.log(error);
  }
};
