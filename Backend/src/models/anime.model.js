const mongoose = require("mongoose");
const db = require("../configs/db.config");

const { Schema } = mongoose;

const animeSchema = new Schema({
  title: { type: String, required: true },
  numberOfEpisodes: { type: String, required: true },
  episode: [
    {
      title: { type: String, required: true },
      duration: { type: Number, required: true },
      minutesWatched: { type: Number, required: true, default: 0 },
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
