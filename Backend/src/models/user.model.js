const mongoose = require("mongoose");
const db = require("../configs/db.config");

/*
check if the string is base64 encoded. options is optional and defaults to { urlSafe: false }
when urlSafe is true it tests the given base64 encoded string is url safe.
isBase64(str [, options])
*/

const { Schema } = mongoose;
// /**
//  * @typedef User
//  * @property {string} fullname.required true -  User fullname - eg: John Doe
//  * @property {string} username.required  true -  User username - eg: min:5, max:15
//  * @property {string} password.required true -  User password - eg: min:6
//  * @property {string} avatar.required false -  User avatar - eg: imageUrl
//  * @property {boolean} isAdmin.required default: false-  User isAdmin - eg: false
//  * @property {Array.<watchList> } watchList -  User watchList - eg: type, title, image, userStatus, progress, score, numberOfEpisodes
//  */
// /**
//  * @typedef watchList
//  * @property {string} type.required true -  watchList type - eg: Anime, Serie, Film
//  * @property {string} title.required true -  watchList title - eg: Sakurasou no Pet na Kanojo
//  * @property {string} image.required true -  watchList image - eg: imageUrl
//  * @property {string} userStatus.required true -  watchList userStatus - eg: Watching, Completed, Planning, Dropped, Paused
//  * @property {number} progress.required true -  watchList progress - eg: 2
//  * @property {number} score.required false -  watchList score - eg: 8
//  * @property {number} numberOfEpisodes.required true -  watchList numberOfEpisodes - eg: 24
//  */

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
      numberOfEpisodes: {
        type: Number,
        required: true,
      },
    },
  ],
});

const UserModel = db.model("user", userSchema);

module.exports = UserModel;
