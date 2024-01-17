const mongoose = require("mongoose");
const db = require("../configs/db.config");

const { Schema } = mongoose;

/**
 * @typedef Serie
 * @property {string} type.required true -  Serie type - eg: Serie
 * @property {string} title.required true-  Serie title - eg: The Witcher
 * @property {string} numberOfEpisodes.required true-  Serie number of episodes - eg: 8
 * @property {Array.<episode> } episode-  Serie episode - eg: imageUrl, title, epUrl
 * @property {string} description.required true-  Serie description - eg: Geralt of Rivia, a solitary monster hunter...
 * @property {string} status.required true-  Serie status - eg: Finished Airing
 * @property {Array.<genres>} genres-  Serie genres - eg: Action, Adventure, Fantasy
 * @property {string} imageUrl.required true-  Serie image url - eg: imageUrl
 * @property {string} backgroundImgUrl.required true-  Serie background image url - eg: backgroundImgUrl
 */
/**
 * @typedef episode
 * @property {string} imageUrl.required true-  Serie episode image url - eg: imageUrl
 * @property {string} title.required true-  Serie episode title - eg: The End's Beginning
 * @property {string} epUrl.required true-  Serie episode url - eg: epUrl
 */
/**
 *
 * @typedef genres
 * @property {string} genres.required true-  Serie genre - eg: Action, Adventure, Fantasy
 */

const serieSchema = new Schema({
  type: { type: String, required: true },
  title: { type: String, required: true },
  numberOfEpisodes: { type: String, required: true },
  episode: [
    {
      imageUrl: { type: String, required: true },
      title: { type: String, required: true },
      epUrl: { type: String, required: true },
    },
  ],
  description: { type: String, required: true },
  status: { type: String, required: true },
  genres: { type: [String], required: true },
  imageUrl: { type: String, required: true },
  backgroundImgUrl: { type: String, required: true },
});

const SerieModel = db.model("series", serieSchema);

module.exports = SerieModel;
