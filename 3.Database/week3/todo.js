var express = require("express");
var mysql = require('mysql');
var bodyParser = require("body-parser");
var app = express();
app.set("view engine", "ejs");
app.use(express.static("public"));
app.use(bodyParser.urlencoded({extended: true}));

app.use(express.json());

//connect with mysql
const db = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'root23',
    database : 'db_TODO'
})

//to get data from user mysql
app.get('/user', (req,res) => {
    db.query("SELECT * FROM user", (err,result) => {
        if(err) {
            console.log(err);
        } else{
            res.send(result);
        }
    })
});

app.get('/list', (req,res) => {
    db.query("SELECT * FROM list", (err,result) => {
        if(err) {
            console.log(err);
        } else{
            res.send(result);
        }
    })
});

app.get('/item', (req,res) => {
    db.query("SELECT * FROM item", (err,result) => {
        if(err) {
            console.log(err);
        } else{
            res.send(result);
        }
    })
});

var i1  = [];
app.get("/", function(req, res) {
    res.render("list",{newListItem:i1});
});

app.post("/", function(req,res){
     i=req.body.n;
    i1.push(i)
    res.redirect("/");
})

app.listen(3000, function () {
    console.log("App running at http://localhost:3000")
});
