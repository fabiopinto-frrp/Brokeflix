const AnimeModel = require("../models/anime.model");

const getAnimeData = async (req, res) => {
  try {
    const anime = await AnimeModel.find();
    res.status(200).json(anime);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = getAnimeData;
