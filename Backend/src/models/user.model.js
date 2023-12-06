const mongoose = require("mongoose");
const db = require("../configs/db.config");
const { isLength, isBase64 } = require("validator");
/*
check if the string is base64 encoded. options is optional and defaults to { urlSafe: false }
when urlSafe is true it tests the given base64 encoded string is url safe.
isBase64(str [, options])
*/

const { Schema } = mongoose;
const userSchema = new Schema({
  fullName: { type: String, required: [true, "Please enter your Full Name"] },
  username: {
    type: String,
    lowercase: true,
    required: [true, "Please enter your Username"],
    unique: true,
    validate: isLength("Please enter a valid username ", [{ min: 5, max: 15 }]),
  },

  password: {
    type: String,
    required: [true, "Please enter your Password"],
    minlength: [6, "Password should be at least 6 characters long"],
  },
  avatar: { type: String, required: false },
  isAdmin: { type: Boolean, default: false },
  watchList: [
    {
      mediaType: {
        type: String,
        required: [true, "Please type the media Type (Anime, Serie, Film)"],
      },
      status: {
        type: String,
        required: [
          true,
          "Please say the status! (Watching , Planned, On Hold)",
        ],
      },
      progress: {
        type: Number,
        required: [true, "Please say your progress ( ep watched 0, 1 , 2 ,3)"],
      },
    },
  ],
});

userSchema.post("save", function (doc, next) {
  console.log("New User Created", doc);
  next();
});

userSchema.pre("save", function (next) {
  console.log("User near creation", this);

  next();
});

const UserModel = db.model("user", userSchema);

module.exports = UserModel;
