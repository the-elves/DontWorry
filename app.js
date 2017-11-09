var express = require('express'), stylus = require('stylus'), nib = require('nib'), bodyParser = require('body-parser')
var app = express()
function compile(str, path){
    return stylus(str)
	.set('filename', path)
	.use(nib())
}
var mysql = require('mysql')

var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'DontWorry'
})

connection.connect(function(err) {
  if (err) throw err
  console.log('You are now connected...')
})
app.set('views', __dirname+'/views')
app.set('view engine', 'jade')
app.use(express.logger('dev'))
app.use(stylus.middleware(
    {src:__dirname +'/public'
     ,compile: compile
    }
))
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use(express.static(__dirname + '/public'))

app.get('/', function(req, res){
    res.render('index',
	       {title:'Home'}
	      )

});

app.post('/complaintRegistration', function(req, res){
    var name = req.body.name;
    var uid  = req.body.aadhaar;
    var age  = req.body.age;
    var phno = req.body.phone;
    var email = req.body.email;
    var category = req.body.category;
    console.log(category);
    if(category == 'ewallet'){
	res.render('eWallet',
		   {title:'eWallet'}
		  )
    }
    else if(category == 'upi'){
	res.render('upi',
		   {title:'UPI'}
		  )
    }
    else if(category == 'online'){
	res.render('onlinePay',
		   {title:'Online Payment'}
		  )
    }
    else if(category == 'pos'){
	res.render('pos_details',
		   {title:'Point of Sale'}
		  )
    }	
    
});

app.listen(3000)
