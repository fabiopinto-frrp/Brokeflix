const mongoose = require("mongoose");
const db = require("../configs/db.config");

const { Schema } = mongoose;
/**
 * @typedef Film
 * @group Film
 * @property {string} type.required true -  Film type - eg: Film
 * @property {string} title.required true -  Film title - eg: The Godfather
 * @property {string} description.required  true -  Film description - eg: The aging patriarch of an organized crime...
 * @property {string} status.required true-  Film status - eg: Released
 * @property {string} imageUrl.required true-  Film image url - eg: imageUrl
 * @property {string} backgroundImgUrl.required true-  Film background image url - eg: backgroundImgUrl
 * @property {string} videosUrl.required true-  Film videos url - eg: videosUrl
 * @property {Array.<genres>} genres -  Film genres - eg: Crime, Drama
 */
/**
 * @typedef genres
 * @property {string} genre.required true -  Film genre - eg: Crime, Drama
 */

const filmSchema = new Schema({
  type: { type: String, default: "Film", required: true },
  title: { type: String, required: true },
  description: { type: String, required: true },
  genres: { type: [String], required: true },
  status: { type: String, required: true },
  imageUrl: { type: String, required: true },
  backgroundImgUrl: { type: String, required: true },
  videosUrl: { type: String, default: "Empty", required: false },
});

const FilmModel = db.model("films", filmSchema);

module.exports = FilmModel;
