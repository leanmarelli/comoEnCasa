const express = require('express');
const router = express.Router();
const categoryController = require('../controllers/categoryController');

router.get('/:id', categoryController.index);


module.exports = router;