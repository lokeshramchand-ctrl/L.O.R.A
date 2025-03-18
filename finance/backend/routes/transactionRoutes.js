const express = require('express');
const router = express.Router();
const { addTransaction, getTransactions } = require('../controllers/transactionController');
const authMiddleware = require('../middleware/authMiddleware');

router.post('/', authMiddleware, addTransaction);
router.get('/', authMiddleware, getTransactions);

module.exports = router;