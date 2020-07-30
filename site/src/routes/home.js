const express = require('express');
const router = express.Router();
const homeController = require('../controllers/homeController');

/* GET home page. */
router.get('/', homeController.index);

router.get('/privacy', homeController.privacy);
router.get('/cookies', homeController.cookies);
router.get('/shipping', homeController.shipping);
router.get('/contact', homeController.contact);



module.exports = router;

//TERMINADO