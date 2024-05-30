const express = require("express");
const mongoose = require("mongoose");

const locationRouter = require("./routes/location");

const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://anshul1234:anshul1234@cluster0.i3luogh.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

app.use(express.json());
app.use(locationRouter);

//Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0" , () => {
  console.log(`connected at port ${PORT}`);
});
