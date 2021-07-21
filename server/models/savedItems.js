const mongoose = require('mongoose');

const savedItemsSchema = new mongoose.Schema({
  owner: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  item: { type: mongoose.Schema.Types.ObjectId, ref: 'Item' },
});

const savedItemsModel = mongoose.model('savedItem', savedItemsSchema);

module.exports = savedItemsModel;
