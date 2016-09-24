var express = require('express');
var router = express.Router();

module.exports = function(app,passport) {
router.post('/listUser', function(req, res) {
	// List user page
});

router.post('/register', function(req, res, next) {
  passport.authenticate('local-signup', function(err, user, info) {
    if (err) {
      return next(err);
    }
    if (!user) {
      return res.status(401).json({
        err: info
      });
    }
    req.logIn(user, function(err) {
      if (err) {
        return res.status(500).json({
          err: 'Could not register user'
        });
      }
	  
		if (req.body.remember) {
		  req.session.cookie.maxAge = 1000 * 60 * 3;
		} else {
		  req.session.cookie.expires = false;
		}
		
      res.status(200).json({
        status: 'Registration successful!'
      });
    });
  })(req, res, next);
});




// process the login form

router.post('/login', function(req, res, next) {
  passport.authenticate('local-login', function(err, user, info) {
    if (err) {
      return next(err);
    }
    if (!user) {
      return res.status(401).json({
        err: info
      });
    }
    req.logIn(user, function(err) {
      if (err) {
        return res.status(500).json({
          err: 'Could not log in user'
        });
      }
	  
		if (req.body.remember) {
		  req.session.cookie.maxAge = 1000 * 60 * 3;
		} else {
		  req.session.cookie.expires = false;
		}
		
      res.status(200).json({
        status: 'Login successful!'
      });
    });
  })(req, res, next);
});


router.get('/logout', function(req, res) {
	req.logout();
	res.redirect('/');
});
	
router.get('/status', function(req, res) {
  if (!req.isAuthenticated()) {
    return res.status(200).json({
      status: false
    });
  }
  
  res.status(200).json({
    status: true
  });
  console.log("Hello");
});

	return router;
}

//module.exports = router;
// route middleware to make sure
