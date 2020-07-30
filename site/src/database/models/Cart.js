module.exports = (sequelize, DataTypes) => {
    const Cart = sequelize.define('Cart', {
        cartNumber: DataTypes.INTEGER,
        total: DataTypes.DECIMAL,
        idUser: DataTypes.INTEGER,

    }, {
        tableName: 'cart'
    });
    Cart.associate = function (models) {
        Cart.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'idUser'
        })

         Cart.hasMany(models.CartItem, {
             as: 'items',
             foreignKey: 'idCart'
        })
    };
    return Cart;
};