// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth.js");
const adminRouter = require("./routes/admin.js");
const productRouter = require("./routes/product.js");

//INIT
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://anish:anish@cluster0.9muccl9.mongodb.net/?retryWrites=true&w=majority";

//middlewarec
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Sucessful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
