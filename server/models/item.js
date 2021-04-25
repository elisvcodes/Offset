const mongoose = require('mongoose');

const itemSchema = new mongoose.Schema({
  bio_time: Number,
  brand: String,
  carbon: Number,
  description: String,
  followers: String,
  id: String,
  image_url: String,
  is_generic: Boolean,
  is_green: Boolean,
  is_reusable: Boolean,
  item_category: String,
  item_tags: String,
  lifespam: Number,
  price: Number,
  product_link: String,
  title: String,
});

const Item = mongoose.model('Item', itemSchema);

module.exports = Item;
