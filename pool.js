const mysql=require('mysql');
let pool=mysql.createPool({
    host:'127.0.0.1',
    port:'3306',
    user:'root',
    password:'',
    database:'gjw',
    connectionLimit:20
});

module.exports=pool;