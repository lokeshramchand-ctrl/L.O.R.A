const Transaction = require('../models/Transaction');

exports.addTransaction = async (req, res) => {
  const { title, amount, type, category, date } = req.body;
  const newTransaction = new Transaction({ title, amount, type, category, date, user: req.user.id });
  await newTransaction.save();
  res.status(201).json(newTransaction);
};

exports.getTransactions = async (req, res) => {
  const transactions = await Transaction.find({ user: req.user.id });
  res.json(transactions);
};