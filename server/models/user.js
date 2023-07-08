const mongoose = require("mongoose");


const UserSchema = mongoose.Schema({
    name:{
        required: true,
        type: String,
        trim: true,
    },
    password: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator:(value) => {
                return value.length>6;
            },  
            message: "Create a stronger password"
        }
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: "Please enter a valid email address"
        }
    },

});

const User = mongoose.model("User", UserSchema);

module.exports = User;