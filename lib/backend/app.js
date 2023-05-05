const express = require('express');
const body_parser=require('body-parser');
const registration_router = require('./routes/registration.router');

const app = express();
app.use(body_parser.json());

app.use('/',registration_router);
 
module.exports=app;