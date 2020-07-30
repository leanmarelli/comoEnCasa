const indexController = {
    index: (req, res) => {
        let vac = {
            title: 'HOME'
        }
       return  res.render('index', vac);
    }
};

module.exports = indexController;

