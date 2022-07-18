/* 

console.log("Data Collection App");

let yourName = prompt('What is your name: ');
console.log(`Hello ${yourName}`); 
*/

const promptSync = require('prompt-sync');
const prompt = promptSync();

/*let input = '';

while(true){
    input = prompt("Enter data: ");
    if(input == 'exit')
    break;
    console.log(input); 
} */

const mysql = require('mysql');
let con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'lexnode'
});

/*This is C in CRUD (Create)*/
/*con.connect(function (err) {
    con.query("INSERT INTO cars VALUES (1, 'Volvo', '240', 1985)"),
        function (err, result, fields) {
            console.log(result);
        }
} );
*/

/*This is R in CRUD (Read) */

let readDb = () =>{
    con.connect(function(err){
        con.query("SELECT * FROM cars", 
            function(err, result, fields){
                console.log(result);
            }
        )
    });
}

//readDb(); 

/*This is U in CRUD (Update) */
let updateDb = () =>{
    con.connect(function(err){
        con.query("UPDATE cars SET model = 'P90' WHERE id = 1 ", 
            function(err, result, fields){
                console.log(result);
            }
        )
    });
}

//updateDb(); 

/*This is D in CRUD (Delete) */
let deleteDb = () =>{
    con.connect(function(err){
        con.query("DELETE FROM cars WHERE id = 1", 
            function(err, result, fields){
                console.log(result);
            }
        )
    });
}

deleteDb; 
