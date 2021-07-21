const Item = require('../models/item');
const User = require('../models/user');
const savedItems = require('../models/savedItems');

exports.getAllItems = (req, res) => {
  Item.find({}).exec((err, result) => {
    if (err) {
      return res.status(400).json(err);
    }
    res.status(200).json(result);
  });
};

exports.getSingleItem = (req, res) => {
  Item.findOne({ id: req.params.id }).exec((err, result) => {
    if (err) {
      return res.status(400).json(err);
    }
    res.status(200).json(result);
  });
};

exports.getSavedItems = (req, res) => {
  User.findOne({ _id: req.user._id }).exec((err, user) => {
    if (err) {
      return res.status(400).json(err);
    }
    savedItems
      .find({ owner: user._id })
      .select('item')
      .exec((err, result) => {
        if (err) {
          return res.status(400).json(err);
        }
        const ids = result.map((item) => item.item);
        Item.find({ _id: { $in: ids } }).exec((err, items) => {
          if (err) {
            return res.status(400).json(err);
          }
          res.status(200).json(items);
        });
      });
  });
};

exports.saveItem = (req, res) => {
  User.findOne({ _id: req.user._id }).exec((err, user) => {
    if (err) {
      return res.status(400).json(err);
    }
    Item.findOne({ _id: req.params.id }).exec(async (err, item) => {
      if (err) {
        return res.status(400).json(err);
      }
      const savedItem = await savedItems.findOne({ item: item._id });
      if (savedItem === null) {
        const itemToSave = new savedItems({
          owner: req.user._id,
          item: req.params.id,
        });
        itemToSave.save();
      } else {
        savedItems.findOneAndDelete({ item: item._id }).exec((err) => {
          if (err) {
            return res.status(400).json(err);
          }
        });
      }
    });
    res.json(user);
  });
};
