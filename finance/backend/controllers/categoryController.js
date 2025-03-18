const Category = require('../models/Category');

exports.addCategory = async (req, res) => {
  const { name } = req.body;
  const newCategory = new Category({ name, user: req.user.id });
  await newCategory.save();
  res.status(201).json(newCategory);
};