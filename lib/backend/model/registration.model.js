//Model => Defining Schema (Structure) for the Databases.

const mongoose = require('mongoose');
const dbconnection = require('../database');

const Registration_Schema = new mongoose.Schema({

    fullname:{
        type:String,
        required:true
    },
    email:{
        type:String,
        required:true,
        unique:true
    },
    mobile:{
        type:Number,
        required:true,
    },
    password:{
        type:String,
        required:true,
    }
})

const Registration_Schema_Model=mongoose.model('Registration',Registration_Schema);

module.exports=Registration_Schema_Model;