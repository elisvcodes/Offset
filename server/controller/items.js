const Item = require('../models/item');
exports.getAllItems = (req, res) => {
  Item.find({}).exec((err, result) => {
    if (err) {
      return res.status(400).json(err);
    }
    res.status(200).json(result);
  });
};

exports.getSingleItem = (req, res) => {
  console.log(req.params);
  Item.findOne({ id: req.params.id }).exec((err, result) => {
    if (err) {
      return res.status(400).json(err);
    }
    res.status(200).json(result);
  });
};
