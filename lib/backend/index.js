const app = require('./app');
const dbconnection = require('./database');
const Registration_Schema_Model=require('./model/registration.model')

const port = 8000;


app.get('/hello',(req,res)=>{
    res.send('hello world');
})

app.listen(port,()=>{
    console.log(`connection estabhlised at port :${port}`);
})