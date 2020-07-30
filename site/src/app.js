const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const session = require('express-session');
const log = require('./middlewares/log')
const cors = require('cors')

// ************ express() - (don't touch) ************
const app = express();

// ************ Middlewares - (don't touch) ************
app.use(session({
  secret: 'comoencasa',
  resave: false,
  saveUninitialized: true
}))


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, '../public')));

// ************ Template Engine - (don't touch) ************
app.set('views', path.join(__dirname, '/views'));
app.set('view engine', 'ejs');


// Our middlewares

app.use(log);
app.use(cors())

// ************ WRITE YOUR CODE FROM HERE ************
// ************ Route System require and use() ************
const indexRouter = require('./routes/index');
const homeRouter = require('./routes/home');
const usersRouter = require('./routes/users');
const searchRouter = require('./routes/search'); 
const categoryRouter = require('./routes/category'); 
const productRouter = require('./routes/product'); 
const favoriteRouter = require('./routes/favorite'); 
const cartRouter = require('./routes/cart'); 

//API require route system
const categoriesApiRouter = require('./routes/apis/categoriesApiRouter');
const productsApiRouter = require('./routes/apis/productsApiRouter');


app.use('/', indexRouter);
app.use('/home', homeRouter);
app.use('/users', usersRouter);
app.use('/search', searchRouter); 
app.use('/category', categoryRouter); 
app.use('/product', productRouter); 
app.use('/favorite', favoriteRouter); 
app.use('/cart', cartRouter); 


// API routes

app.use('/api/categories', categoriesApiRouter);
app.use('/api/products', productsApiRouter);


// ************ DON'T TOUCH FROM HERE ************
// ************ catch 404 and forward to error handler ************
app.use(function(req, res, next) {
  next(createError(404));
});

// ************ error handler ************
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});


// ************ exports app - dont'touch ************
module.exports = app;
