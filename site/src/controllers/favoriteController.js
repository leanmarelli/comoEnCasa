const { User, Product, Favorite } = require('../database/models');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const db = require('../database/models')



const favoriteController = {
  index: (req, res) => {


    Favorite.findAll({
      where: {
          idUser: req.session.user.id
      },
      include: [{
        association: 'followed'
      }],
    })
      
      .then((favorites) => {
        return res.render("favorite", { favorites })
      })
      .catch(e => console.log(e))

    // const favUserName = User.findByPk(req.body.id);


    // Promise.all([favUserName, createFavorite])
    //   .then((favUserName) => {
    //     return res.render('favorite', { favUserName })
    //   })
    //   .catch(e => console.log(e))

  },
  add: (req, res) => {

       let favorite = {
         idSeller: req.body.id,
         idUser: req.session.user.id,
       }
       Favorite.create(favorite)

       .then(() => {
         return res.redirect('/favorite');
          })
          .catch(e => console.log(e))
  },

  destroy: (req, res) => {

    Favorite.destroy({
      where: {
        id: req.body.idSeller
      }
    })
      .then(() => {
        return res.redirect('/favorite')
      })
      .catch(error => console.log(error))
  },
};


module.exports = favoriteController;