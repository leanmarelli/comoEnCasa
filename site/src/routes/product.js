const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');
const multer = require('multer');
const path = require('path');
const validator = require('../middlewares/validator');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, path.resolve(__dirname, '../../public/img'))
    },
    filename: function (req, file, cb) {
        cb(null, file.filename + '-' + Date.now() + path.extname(file.originalname))
    }
})
var upload = multer({
    storage: storage,
    // Validate image
    fileFilter: (req, file, cb) => {
        console.log(file)
        const acceptedExtensions = ['.jpg', '.jpeg', '.png'];
        const ext = path.extname(file.originalname);
        if (!acceptedExtensions.includes(ext)) {
            req.file = file;
        }
        cb(null, acceptedExtensions.includes(ext));
    }
});


router.get('/', productController.index);
router.get('/detail/:productId/', productController.detail);

router.get('/create/', productController.create);
router.post('/create/', upload.single('img'), validator.creacion, productController.store);

router.get('/edit/:productId', productController.edit);
router.post('/edit/:productId', upload.single('img'), validator.edicion, productController.update); /* PUT - Update in DB */

router.post('/delete/', productController.destroy); 

router.get('/:productId', productController.show);






module.exports = router;


