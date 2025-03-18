const Transaction = require('../models/Transaction');

exports.addTransaction = async (req, res) => {
  const { title, amount, type, category, date } = req.body;
  try {
    const newTransaction = new Transaction({
      title,
      amount,
      type,
      category,
      date,
      user: req.user.id, // Assuming you're using authentication
    });
    await newTransaction.save();
    res.status(201).json(newTransaction);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.getTransactions = async (req, res) => {
  try {
    const transactions = await Transaction.find({ user: req.user.id });
    res.json(transactions);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};