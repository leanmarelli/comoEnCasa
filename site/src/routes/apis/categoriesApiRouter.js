const express = require('express');
const router = express.Router();
const categoriesApiController = require('../../controllers/apis/categoriesApiController');

router.get('/', categoriesApiController.index);


module.exports = router;