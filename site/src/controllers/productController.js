const {validationResult} = require('express-validator');
const { Product, Category} = require('../database/models');
const db = require('../database/models');


const productController = {
    index: (req, res) => {
        let vac = {
            title: 'Producto'
        }
        return res.render('product', vac);

    },

    detail: (req, res) => {
        Product.findByPk(req.params.productId, {
                include: ['category', 'user']
            })
            .then(product => {
                return res.render('detail', {
                    product
                })
            })
            .catch(error => console.log(error))
    },

    create: (req, res) => {
        Category.findAll()
            .then(categories => {
                return res.render('createProduct', { categories });
            })
            .catch(error => console.log(error))
    },

    store: (req, res) => {
        const errors = validationResult(req)
         //return res.send(req.body);
                if (errors.isEmpty()) {
            let product = req.body
            product.img = req.file.filename;
            product.idSeller = req.session.user.id;
            product.idCategory = req.body.idCategory
    
            Product.create(product)
                .then(product => {
                    return res.redirect('/product/detail/' + product.id)
                })
                 .catch(error => console.log(error))
        } else {
            // Mostrar los errores
              Category.findAll()
                  .then(categories =>{
              
                    return res.render('createProduct', { categories,  errors: errors.mapped(), old: req.body });
                    })
                  .catch(error => console.log(error))
    }
    },

    edit: (req, res) => {

        let product = Product.findByPk(req.params.productId);

        const categories = Category.findAll();

        Promise.all([product, categories])
            .then(([product, categories]) => {
                return res.render('editProduct', {
                    product,
                    categories
                })
            })
            .catch(error => console.log(error))
    },

    update: (req, res) => {
        const errors = validationResult(req)
        if (errors.isEmpty()) {
            Product.findByPk(req.params.productId)
                .then(productoEncontrado => {
                    let product = req.body;
                    product.idUser = req.session.user.id
                    product.img = req.file ? req.file.filename : productoEncontrado.img
                    
                    Product.update(product, {
                        where: {
                            id: req.params.productId
                        }
                    })
                        .then(confirm => {
                            return res.redirect('/product/detail/' + req.params.productId)
                        })
                        .catch(error => console.log(error))
                })
        } else {
            const product = Product.findByPk(req.params.productId);

            const categories = Category.findAll();

            Promise.all([product, categories])
                .then(([product, categories]) => {
                        let objeto = {
                        product,
                        categories,
                        errors: errors.mapped(),
                        old: req.body
                    }
             //return res.send(errors.mapped())
            return res.render('editProduct', objeto)
                 } )
             .catch(error => console.log(error))
       }
    },

    destroy: (req, res) => {

        Product.destroy({
                where: {
                    id: req.body.id
                }
            })
            .then(() => {
                return res.redirect('/users/profile/' + req.session.user.id)
            })
            .catch(error => console.log(error))
    },

    show: (req, res) => {

        Product.findByPk(req.params.productId, {
                include: {
                    all: true
                }
            })
            .then(producto => {

                return res.render('product', {
                    producto
                })
            })
            .catch(error => console.log(error))
    }

}

module.exports = productController;