//services => CRUD Operations on Databases

const e = require('express');
const Registration_Schema_Model = require('../model/registration.model');

class registration_services{
    static async register_user(fullname,email,mobile,password){
        try{
            const result = new Registration_Schema_Model({fullname,email,mobile,password});
            return await result.save();
        }
        catch(err){
            throw err;
        }
    }
}



//  const registration = async (fullname,email,mobile,password)=>{
//     try{
//        const register_user = new Registration_Schema_Model({fullname,email,mobile,password});
//         console.log(register_user);
//         return await register_user.save();
//     }
//     catch(err){
//         throw err;
//     }

// }

module.exports= registration_services;