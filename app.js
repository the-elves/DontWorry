var express = require('express'), stylus = require('stylus'), nib = require('nib')
var app = express()
function compile(str, path){
    return stylus(str)
	.set('filename', path)
	.use(nib())
}

app.set('views', __dirname+'/views')
app.set('view engine', 'jade')
app.use(express.logger('dev'))
app.use(stylus.middleware(
    {src:__dirname +'/public'
     ,compile: compile
    }
))

app.use(express.static(__dirname + '/public'))

app.get('/', function(req, res){
    res.render('index',
	       {title:'Home'}
	      )

});

app.post('/complaintRegistration', function(req, res){
    res.render('complaintRegistration',
	       {title:'Home'}
	      )
});

app.get('/upi', function(req, res){
    res.render('upi',
	       {title:'UPI'}
	      )
})

app.get('/onlinePay', function(req, res){
    res.render('onlinePay',
	       {title:'Online Payment'}
	      )
})

app.get('/eWallet', function(req, res){
    res.render('eWallet',
	       {title:'e-Wallet Payment'}
	      )
})
app.listen(3000)
