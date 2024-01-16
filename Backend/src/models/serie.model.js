const mongoose = require("mongoose");
const db = require("../configs/db.config");

const { Schema } = mongoose;

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
