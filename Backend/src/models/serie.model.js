const mongoose = require("mongoose");
const db = require("../configs/db.config");

const { Schema } = mongoose;

const serieSchema = new Schema({
  title: { type: String, required: true },
  episodes: { type: Number, required: true },
  description: { type: String, required: true },
  status: { type: [String], required: true },
  genres: { type: [String], required: true },
  imageUrl: { type: String, required: true },
  videosUrl: { type: [String], required: true },
});

const SerieModel = db.model("series", serieSchema);

module.exports = SerieModel;
