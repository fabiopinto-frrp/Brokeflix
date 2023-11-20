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
  passwordHash: { type: String, required: true },
  avatar: { type: String, required: false },
  isAdmin: { type: Boolean, default: false },
  watchList: [
    {
      itemId: { type: Number, required: true }, // Unique identifier for the item (film, anime, series)
      mediaType: { type: String, required: true }, // (film, anime, series)
      status: { type: String, required: true }, // (watching, plan to watch, on hold, completed)
      progress: { type: Number, required: true }, // Episode progress)
    },
  ],
});

const UserModel = db.model("user", userSchema);

module.exports = UserModel;
