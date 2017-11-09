var express = require('express'), stylus = require('stylus'), nib = require('nib'), bodyParser = require('body-parser')
var app = express()
function compile(str, path){
    return stylus(str)
	.set('filename', path)
	.use(nib())
}
var mysql = require('mysql')

var connection = mysql.createConnection({
//   host: '10.16.240.37',
//   host: '172.17.2.78',
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'DontWorry'
})

connection.connect(function(err) {
  if (err) throw err
  console.log('You are now connected...')
//   connection.query('INSERT INTO Entity VALUES("Paytm","Paytm","www.paytm.com/contactus","www.paytm.com","100","care@paytm.com","100","care@cvc.co.in")')
//   {
//       if (err) throw err
//   }
  
//   connection.query('INSERT INTO ComplainVALUES("A001","user1","TXN001","Paytm","ICIC","payumoney","141","connection dropped",false)')
//   {
//       if (err) throw err
//   }
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
    setInterval(incrementScore,60000);
    res.render('index',
	       {title:'Home'}
	      )

});

app.get('/eWallet', function(req, res){
    res.render('eWallet',
	       {title:'eWallet'}
	      )

});

app.get('/onlinePay', function(req, res){
    res.render('onlinePay',
	       {title:'Online Payment'}
	      )

});

app.get('/posPay', function(req, res){
    res.render('posPay',
	       {title:'Point of Sale'}
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
	res.render('posPay',
		   {title:'Point of Sale'}
		  )
    }

});

function incrementScore(){
    connection.query('UPDATE Entity SET Score=Score+0.1 WHERE Score<100');
    // connection.query('UPDATE Entity SET Score=Score+0.1 WHERE Score<100');
    connection.query('UPDATE GateWay SET Score=Score+0.1 WHERE Score<100');
    
}

app.post('/onlinePayComplaintRegistrationForm', function(req,res){
    //check for validity of values
    //skip for now. TODO
    complaintID = 0;
    if(req.body.transactionID && req.body.source && req.body.destination && req.body.gateway && req.body.errorCode && req.body.errorText )
    {
        connection.query('INSERT INTO Complain\
        (UserId,TransactionId,Source,Destination,gateway,errorCode,errorText,timestamp) \
        VALUES(?,?,?,?,?,?,?,?)',
        ["1", req.body.transactionID, req.body.source, req.body.destination, req.body.gateway, req.body.errorCode, req.body.errorText, req.body.timestamp],
    function(err, result){
        if(err) throw err
        complaintID = result.complaintID;
    })
    }
    else
    {
        console.log("Not complete data");
        return res.render('index',
            {title:'Index'});
    }
    
    //values are valid now
    if(req.body.source)
    {
        console.log(req.body.source);
            connection.query('UPDATE Entity SET Score=Score-1 WHERE code=?',[req.body.source])
            {
                // if(err) throw err
            }
            connection.query('SELECT Score FROM Entity WHERE code=?',[req.body.source],function(err,score){
                if(err) throw err
                if(score < 96)
                {
                    console.log("Issue advisory to " + req.body.source);
                    // connection.query('INSERT INTO ErrorLog (entity,time,message) VALUES()');
                }
            })
    }
    if(req.body.destination && req.body.destination != req.body.source)
    {
            connection.query('UPDATE Entity SET Score=Score-1 WHERE code=?',[req.body.destination])
            {
            }
            connection.query('SELECT Score FROM Entity WHERE code=?',[req.body.destination],function(err,score){
                if(err) throw err
                if(score < 96)
                    console.log("Issue advisory to" + req.body.destination);
            })
    }

    if(req.body.gateway)
    {
            connection.query('UPDATE GateWay SET Score=Score-1 WHERE code=?',[req.body.gateway])
            {
            }
            connection.query('SELECT Score FROM GateWay WHERE code=?',[req.body.gateway],function(err,score){
                if(err) throw err;
                if(score < 96)
                    console.log("Issue advisory to" + req.body.gateway);
            })
    }
    
    res.render('result',
        {title:'Response',complaintID:complaintID,responseText:"responseText"});
})

app.post('/eWalletComplaintRegistrationForm', function(req,res){
    //check for validity of values
    //skip for now. TODO
    
    if(req.body.transactionID && req.body.source && req.body.destination && req.body.errorCode && req.body.errorText && req.body.timestamp)
    {
        connection.query('INSERT INTO Complain\
        (UserId,TransactionId,Source,Destination,gateway,errorCode,errorText,timestamp) \
        VALUES(?,?,?,?,?,?,?,?)',
        ["1", req.body.transactionID, req.body.source, req.body.destination, "" , req.body.errorCode, req.body.errorText, req.body.timestamp],
        function(err, result){
            if(err) throw err;
            complaintID = result.complaintID;
        })
    }
    else
    {
        console.log("Not complete data");
        res.render('index',
            {title:'Index'});
    }
    //values are valid now
    if(req.body.source)
    {
        console.log(req.body.source);
            connection.query('UPDATE Entity SET Score=Score-1 WHERE code=?',[req.body.source])
            {
                // if(err) throw err
            }
            connection.query('SELECT Score FROM Entity WHERE code=?',[req.body.source],function(err,score){
                if(err) throw err
                if(score < 96)
                    console.log("Issue advisory to " + req.body.source);
            })
    }
    if(req.body.destination && req.body.destination != req.body.source)
    {
            connection.query('UPDATE Entity SET Score=Score-1 WHERE code=?',[req.body.destination])
            {
            }
            connection.query('SELECT Score FROM Entity WHERE code=?',[req.body.destination],function(err,score){
                if(err) throw err
                if(score < 96)
                    console.log("Issue advisory to" + req.body.destination);
            })
    }

    res.render('result',
    {title:'Response',complaintID:complaintID,responseText:"responseText"});
})


app.post('/posPayComplaintRegistrationForm', function(req,res){
    //check for validity of values
    //skip for now. TODO
    if(req.body.transactionID && req.body.source && req.body.destination && req.body.errorCode && req.body.errorText && req.body.timestamp)
    {
        connection.query('INSERT INTO Complain\
        (UserId,TransactionId,Source,Destination,errorCode,errorText,timestamp) \
        VALUES(?,?,?,?,?,?,?,?)',
        ["1", req.body.transactionID, req.body.source, req.body.destination, req.body.errorCode, req.body.errorText, req.body.timestamp],
        function(err, result){
            complaintID = result.complaintID;
        })
    }
    else
    {
        console.log("Not complete data");
        res.render('index',
            {title:'Index'});
    }
    
    //values are valid now
    if(req.body.source)
    {
        console.log(req.body.source);
            connection.query('UPDATE Entity SET Score=Score-1 WHERE code=?',[req.body.source])
            {
                // if(err) throw err
            }
            connection.query('SELECT Score FROM Entity WHERE code=?',[req.body.source],function(err,score){
                if(err) throw err
                if(score < 96)
                    console.log("Issue advisory to " + req.body.source);
            })
    }
    if(req.body.destination && req.body.destination != req.body.source)
    {
            connection.query('UPDATE Entity SET Score=Score-1 WHERE code=?',[req.body.destination])
            {
            }
            connection.query('SELECT Score FROM Entity WHERE code=?',[req.body.destination],function(err,score){
                if(err) throw err
                if(score < 96)
                    console.log("Issue advisory to" + req.body.destination);
            })
    }

    res.render('result',
    {title:'Response',complaintID:complaintID,responseText:"responseText"});
})


app.post('/upiPayComplaintRegistrationForm', function(req,res){
    //check for validity of values
    //skip for now. TODO
    if(req.body.transactionID && req.body.source && req.body.destination && req.body.errorCode && req.body.errorText && req.body.timestamp)
    {
        connection.query('INSERT INTO Complain\
        (UserId,TransactionId,Source,Destination,errorCode,errorText,timestamp) \
        VALUES(?,?,?,?,?,?,?,?)',
        ["1", req.body.transactionID, req.body.source, req.body.destination, req.body.errorCode, req.body.errorText, req.body.timestamp],
        function(err, result){
            complaintID = result.complaintID;
        })
    }
    else
    {
        console.log("Not complete data");
        res.render('index',
            {title:'Index'});
    }
    
    //values are valid now
    if(req.body.source)
    {
        console.log(req.body.source);
            connection.query('UPDATE Entity SET Score=Score-1 WHERE code=?',[req.body.source])
            {
                // if(err) throw err
            }
            connection.query('SELECT Score FROM Entity WHERE code=?',[req.body.source],function(err,score){
                if(err) throw err
                if(score < 96)
                    console.log("Issue advisory to " + req.body.source);
            })
    }
    if(req.body.destination && req.body.destination != req.body.source)
    {
            connection.query('UPDATE Entity SET Score=Score-1 WHERE code=?',[req.body.destination])
            {
            }
            connection.query('SELECT Score FROM Entity WHERE code=?',[req.body.destination],function(err,score){
                if(err) throw err
                if(score < 96)
                    console.log("Issue advisory to" + req.body.destination);
            })
    }

    res.render('result',
    {title:'Response',complaintID:complaintID,responseText:"responseText"});
})


app.listen(3000)
