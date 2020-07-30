const { Product , Category } = require('../../database/models');

const productsApiController = {
  
  index: (req, res) => {
     Product.findAll()
        .then((data) => {

            let apiResponse = null;

            if(data){
                apiResponse = {
                    meta: {
                        status: 200,
                        length: data.length,
                        url: req.originalUrl
                    },
                    data: data
                } 

            } else{
                apiResponse = {
                    meta: {
                        status: 404
                    },
                    data: null
                }    
            };

            return res.json(apiResponse)
        })
        .catch(error => {
            let apiResponse = {
                meta: {
                    status: 404
                },
                data: null
            }

            return res.json(apiResponse)
        });
    },

    detail: (req, res) => {

        Product.findByPk(req.params.productId, {
                include: ['category', 'user']
            })
            .then((product) => {

                let apiResponse = null;
    
                if(product){
                    apiResponse = {
                        meta: {
                            status: 200,
                            length: product.length,
                            url: req.originalUrl
                        },
                        data: product
                    }
    
                } else{
                    apiResponse = {
                        meta: {
                            status: 404
                        },
                        data: null
                    }    
                };
    
                return res.json(apiResponse)
            })
            .catch(error => {
                let apiResponse = {
                    meta: {
                        status: 404
                    },
                    data: null
                }
     
                return res.json(apiResponse)
            });

    },

    // create: (req, res) => {
    //     Category.findAll()
    //     .then((category) => {

    //         let apiResponse = null;

    //         if(category){
    //             apiResponse = {
    //                 meta: {
    //                     status: 200,
    //                     length: category.length,
    //                     url: req.originalUrl
    //                 },
    //                 data: category
    //             }

    //         } else{
    //             apiResponse = {
    //                 meta: {
    //                     status: 404
    //                 },
    //                 data: null
    //             }    
    //         };

    //         return res.json(apiResponse)
    //     })
    //     .catch(error => {
    //         let apiResponse = {
    //             meta: {
    //                 status: 404
    //             },
    //             data: null
    //         }

    //         return res.json(apiResponse)
    //     });
    // }, 

    // store: (req, res) => {

    //     const errors = validationResult(req)
    //     if (errors.isEmpty()) {
    //         let product = req.body;
    //         product.img = req.file.filename;
    //         product.idSeller = req.session.user.id;
    //         product.idCategory = req.body.idCategory

    //         Product.create(product)
    //             .then(product => {
    //                 return res.redirect('/producto/detail/' + product.id)
    //             })
    //             .catch(error => console.log(error))
    //     } else {
    //         // Mostrar los errores
    //           Category.findAll()
    //               .then(categories =>{
              
    //         //return res.send(errors.mapped())
    //         return res.render('creacionProducto', { categories,  errors: errors.mapped(), old: req.body });
    //     })
    //               .catch(error => console.log(error))
    // }
    // }

};

module.exports = productsApiController;