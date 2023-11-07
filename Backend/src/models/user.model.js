const mongoose = require("mongoose");
const db = require("../configs/db.config");

const { Schema } = mongoose;
const userSchema = new Schema({
  fullName: { type: String, required: true },
  email: {
    type: String,
    lowercase: true,
    required: true,
    unique: true,
  },
});

// Use the AutoIncrement utility for the "userId" field

const UserModel = db.model("user", userSchema);

module.exports = UserModel;
