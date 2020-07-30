module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('User', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: DataTypes.STRING,
        email: DataTypes.STRING,
        password: DataTypes.STRING,
        rol: DataTypes.BOOLEAN
    });
    User.associate = function (models) {
        User.hasMany(models.Product, {
            as: 'products',
            foreignKey: 'idSeller'
        })

        User.hasMany(models.Cart, {
            as: 'carts',
            foreignKey: 'idUser'
        })

        User.hasMany(models.Favorite, {
            as: 'follows',
            foreignKey: 'idUser'
        })

        User.hasMany(models.Favorite, {
            as: 'followers',
            foreignKey: 'idSeller'
        })

        User.hasMany(models.CartItem, {
            as: 'items',
            foreignKey: 'idUser'
        })

        User.hasMany(models.CartItem, {
            as: 'itemSeller',
            foreignKey: 'idSeller'
        })


    };
    return User;
};
