const mongoose = require('mongoose');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

const userSchema = new mongoose.Schema(
  {
    fullName: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,
    },
    avatar: {
      type: String,
    },
    savedItems: [],
    tokens: [
      {
        token: {
          type: String,
          required: true,
        },
      },
    ],
  },

  { timestamps: true }
);

userSchema.pre('save', async function (next) {
  if (this.isModified('password')) {
    this.password = await bcrypt.hash(this.password, 8);
  }
  next();
});

userSchema.methods.generateToken = async function () {
  try {
    const token = jwt.sign({ _id: this._id.toString() }, 'hello');
    this.tokens = this.tokens.concat({ token });
    await this.save();
  } catch (error) {
    throw error;
  }
};

userSchema.statics.findByEmail = async (email, password) => {
  try {
    const user = await User.findOne({ email });
    if (!user) throw 'No User was found';

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) throw 'Wrong Password';

    return user;
  } catch (error) {
    throw error;
  }
};

userSchema.methods.toJSON = function () {
  const user = this.toObject();
  delete user.password;
  delete user.confirmPassword;
  delete user.tokens;
  return user;
};

const User = mongoose.model('User', userSchema);

module.exports = User;
