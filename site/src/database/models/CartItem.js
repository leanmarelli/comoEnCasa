module.exports = (sequelize, DataTypes) => {
    const CartItem = sequelize.define('CartItem', {
        name: DataTypes.STRING,
        price: DataTypes.DECIMAL,
        quantity: DataTypes.INTEGER,
        status: DataTypes.INTEGER,
        subtotal: DataTypes.DECIMAL,
        idCart: DataTypes.INTEGER,
        idSeller: DataTypes.INTEGER,
        idUser: DataTypes.INTEGER,
        idProduct: DataTypes.INTEGER
    }, {
        tableName:'cartitem'
    });
      CartItem.associate = function (models) {
         CartItem.belongsTo(models.Cart, {
             as: 'cart',
             foreignKey: 'idCart'
         })
 
         CartItem.belongsTo(models.User, {
             as: 'user',
             foreignKey: 'idUser'
         })
       CartItem.belongsTo(models.User, {
             as: 'seller',
             foreignKey: 'idSeller'
         })
        CartItem.belongsTo(models.Product, {
             as: 'product',
             foreignKey: 'idProduct'
         })
     };

    return CartItem;
};