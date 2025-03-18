const express = require('express');
const router = express.Router();
const categoryController = require('../controllers/categoryController');
const authMiddleware = require('../middleware/authMiddleware');

// @route   POST /api/categories
// @desc    Add a new category
// @access  Private
router.post('/', authMiddleware, categoryController.addCategory);

// @route   GET /api/categories
// @desc    Get all categories
// @access  Private
router.get('/', authMiddleware, categoryController.getCategories);

// @route   PUT /api/categories/:id
// @desc    Update a category
// @access  Private
router.put('/:id', authMiddleware, categoryController.updateCategory);

// @route   DELETE /api/categories/:id
// @desc    Delete a category
// @access  Private
router.delete('/:id', authMiddleware, categoryController.deleteCategory);

module.exports = router;