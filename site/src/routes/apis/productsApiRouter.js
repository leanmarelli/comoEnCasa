const express = require('express');
const router = express.Router();
const productsApiController = require('../../controllers/apis/productsApiController');

router.get('/', productsApiController.index);
router.get('/detail/:productId/', productsApiController.detail);

//router.get('/create', productsApiController.create);
// router.post('/create/', upload.single('img'), validator.creacion, productoController.store);




module.exports = router;