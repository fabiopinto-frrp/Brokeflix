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
      type: {
        type: String,
        required: [true, "Please enter the type of media (Anime, Serie, Film)"],
      },
      title: {
        type: String,
        required: [true, "Please enter the title of the media item"],
      },
      image: {
        type: String,
        required: [true, "Please enter the URL of the media item's image"],
      },
      animeStatus: { type: String, required: true },
      userStatus: {
        type: String,
        required: [
          true,
          "Please enter the status of the media item (Watching, Planned, On Hold)",
        ],
      },
      progress: {
        type: Number,
        required: [true, "Please enter your progress (episodes watched)"],
      },
      description: {
        type: String,
        required: [true, "Please enter the description of the media item"],
      },
      genres: {
        type: [String],
        required: [true, "Please enter the genres of the media item"],
      },
      rating: {
        type: Number,
        required: [true, "Please enter the rating of the media item"],
      },
      episodes: {
        type: Number,
        required: [
          true,
          "Please enter the number of episodes in the media item",
        ],
      },
    },
  ],
});

const UserModel = db.model("user", userSchema);

module.exports = UserModel;
