module.exports = (sequelize, DataTypes) => {
    const Product = sequelize.define('Product', {
        name: DataTypes.STRING,
        description: DataTypes.TEXT,
        price: DataTypes.DECIMAL,
        img: DataTypes.STRING,
        idCategory: DataTypes.INTEGER,
        idSeller: DataTypes.INTEGER
    }, {});
    Product.associate = function (models) {
        Product.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'idSeller' 
        })
        Product.belongsTo(models.Category, {
            as: 'category',
            foreignKey: 'idCategory'
        })
        Product.hasMany(models.CartItem, {
             as: 'cartitems',
             foreignKey: 'idProduct'
        })
    };
    return Product;
};