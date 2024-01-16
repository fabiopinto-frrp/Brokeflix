const mongoose = require("mongoose");
const db = require("../configs/db.config");

/*
check if the string is base64 encoded. options is optional and defaults to { urlSafe: false }
when urlSafe is true it tests the given base64 encoded string is url safe.
isBase64(str [, options])
*/

const { Schema } = mongoose;
const userSchema = new Schema({
  fullname: { type: String, required: true },
  username: {
    type: String,
    lowercase: true,
    required: true,
    unique: true,
    minlength: 5,
    maxLength: 15,
  },

  password: {
    type: String,
    required: true,
    minlength: 6,
  },
  avatar: { type: String, required: false },
  isAdmin: { type: Boolean, default: false },
  watchList: [
    {
      type: {
        type: String,
        required: true,
      },
      title: {
        type: String,
        required: true,
      },
      image: {
        type: String,
        required: true,
      },
      userStatus: {
        type: String,
        required: true,
      },
      progress: {
        type: Number,
        required: true,
      },
      // genres: {
      //   type: [String],
      //   required: true,
      // },
      score: {
        type: Number,
        required: false,
      },
      episodes: {
        type: Number,
        required: true,
      },
    },
  ],
});

const UserModel = db.model("user", userSchema);

module.exports = UserModel;
