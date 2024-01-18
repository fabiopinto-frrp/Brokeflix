const mongoose = require("mongoose");
const db = require("../configs/db.config");

const { Schema } = mongoose;
// /**
//  * @typedef Anime
//  * @group Anime
//  * @property {string} type.required true -  Anime type - eg: Anime
//  * @property {string} title.required true -  Anime title - eg: Sakurasou no Pet na Kanojo
//  * @property {string} numberOfEpisodes.required true -  Anime number of episodes - eg: 24
//  * @property {Array.<episode> } episode -  Anime episode - eg: imageUrl, title, epUrl
//  * @property {string} description.required true-  Anime description - eg: Sorata Kanda, a high school sophomore living in Sakurasou...
//  * @property {string} status.required true -  Anime status - eg: Finished Airing
//  * @property {Array.<genres>} genres-  Anime genres - eg: Comedy, Drama, Romance, School, Slice of Life
//  * @property {string} imageUrl.required true -  Anime image url - eg: imageUrl
//  * @property {string} backgroundImgUrl.required true -  Anime background image url - eg: backgroundImgUrl
//  */
// /**
//  * @typedef episode
//  * @property {string} imageUrl.required true -  Anime episode image url - eg: imageUrl
//  * @property {string} title.required true -  Anime episode title - eg: Cat, White, Mashiro
//  * @property {string} epUrl.required true -  Anime episode url - eg: epUrl
//  */
// /**
//  * @typedef genres
//  * @property {string} genre.required true -  Anime genre - eg: Comedy, Drama, Romance, School, Slice of Life
//  */
const animeSchema = new Schema({
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

const AnimeModel = db.model("animes", animeSchema);

module.exports = AnimeModel;
