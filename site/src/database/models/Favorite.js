module.exports = (sequelize, DataTypes) => {
    const Favorite = sequelize.define('Favorite', {
        idUser: DataTypes.INTEGER,
        idSeller: DataTypes.INTEGER,

    });
     Favorite.associate = function (models) {
         Favorite.belongsTo(models.User, {
             as: 'followed',
             foreignKey: 'idSeller'
         })
         Favorite.belongsTo(models.User, {
             as: 'follower',
             foreignKey: 'idUser'
         })
    }     
   
    return Favorite;
}