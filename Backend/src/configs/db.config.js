const mongoose = require("mongoose");
const dbConn = process.env.DB_URI;

const connection = mongoose
  .createConnection(`${dbConn}`)
  .on("open", () => {
    console.log("Connected to MongoDB");
  })
  .on("error", (err) => {
    console.log("Connection error:", err);
  });

module.exports = connection;
