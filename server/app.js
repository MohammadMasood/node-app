// dependencies
var express = require('express');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var logger = require('morgan');
var path = require('path');
var app = express();

var passport = require('passport');
var flash = require('connect-flash');

require('./config/passport')(passport); // pass passport for configuration

// define middleware
app.use(express.static(path.join(__dirname, '../client')));
app.use(logger('dev'));
app.use(cookieParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use(session({
	secret: 'vidyapathaisalwaysrunning',
	resave: true,
	saveUninitialized: true
 } )); // session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()); // use connect-flash for flash messages stored in session


// require routes
var routes = require('./routes/api.js')(app,passport);
var pages = require('./routes/pages.js');

app.use(express.static(path.join(__dirname, 'public')));

// routes
app.use('/user/', routes);
app.use('/pages/', pages);

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '../client', 'index.html'));
});


app.get('*', function(req, res) {
  res.sendFile(path.join(__dirname, '../client', 'index.html'));
});


// error handlers
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

app.use(function(err, req, res) {
  res.status(err.status || 500);
  res.end(JSON.stringify({
    message: err.message,
    error: {}
  }));
});

module.exports = app;
