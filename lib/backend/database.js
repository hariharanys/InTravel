const mongoose =require('mongoose');

//Database connection 
//use ip of your device(127.0.0.1:27017),instead of localhost
const dbconnection =  mongoose.connect("mongodb://127.0.0.1:27017/travelappDB")
.then( () => console.log('Connection Established') )
.catch( ()=>console.log('Connection Failed'));

module.exports=dbconnection;
