const express = require('express');
const router = express.Router();
const favoriteController = require('../controllers/favoriteController');

router.get('/', favoriteController.index);

router.post('/add', favoriteController.add);

router.post('/delete/', favoriteController.destroy); 
module.exports = router;
