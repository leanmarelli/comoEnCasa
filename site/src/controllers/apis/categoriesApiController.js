const { Category } = require('../../database/models');

const categoriesApiController = {
  
  index: (req, res) => {
     Category.findAll()
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
    }
};

module.exports = categoriesApiController;