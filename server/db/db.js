const mongoose = require('mongoose');

mongoose.connect(
  'mongodb+srv://user:123@cluster0.u4pg7.mongodb.net/hackathon?retryWrites=true&w=majority',
  { useNewUrlParser: true, useCreateIndex: true }
);
