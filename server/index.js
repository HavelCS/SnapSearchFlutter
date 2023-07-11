// IMPORT FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');
//IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");

//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://snapsearch:wBjI3SUJbThEWtS6@snapsearch.zmcvwu6.mongodb.net/?retryWrites=true&w=majority";
// MIDDLEWARE
app.use(express.json());
app.use(authRouter);


app.post("/upload",(req,res)=>{
    console.log("we ball");
    console.log(req.body);
});


//CONNECTIONS
app.listen(PORT, "0.0.0.0", function(){
    console.log(`Connected at port ${PORT}`);
})


mongoose.connect(DB).then(() => {
    console.log("Connected to the database");
}).catch((e)=> {
    console.log(e)
});
