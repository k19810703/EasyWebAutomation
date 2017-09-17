/**
 * Created by chance on 17-1-9.
 */

var mysql      = require('mysql');
var connstr = {
    host     : 'webautodb',
    user     : 'root',
    password : '123456',
    database : 'autotable'
};
// var db2conn = require('./db2conn');

// var db2connStr = "DATABASE=chancerm;HOSTNAME=9.197.37.37;UID=db2admin;PWD=db2admin;PORT=50000;PROTOCOL=TCPIP";

var dbtype = 2 ;//db2:1  mysql: others

module.exports.getConnection=function(){
    var connection =null;
    if (dbtype ==1) {
        // connection = new db2conn(db2connStr);
    } else {
        connection = mysql.createConnection(connstr);
    }
    return connection;
};
