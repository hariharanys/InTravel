//controller=>To send response and requests from the frontend

const registration_services = require('../servies/registration.servies');

exports.registration_control =async (req,res)=>{
    try{
        const {fullname,email,mobile,password} = req.body;

        const result = await registration_services.register_user(fullname,email,mobile,password);

        res.json({status:'true',success:'User Registerd Successfully'})
    }
    catch(err){
        throw err;
} 
}