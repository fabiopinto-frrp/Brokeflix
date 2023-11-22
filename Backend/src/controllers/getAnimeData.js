const AnimeModel = require("../models/anime.model");
const express = require("express");
const router = express.Router();

router.get("/", async (req, res) => {
  if (req.query.id) {
    const animeId = req.query.id;

    try {
      const anime = await AnimeModel.findById(animeId);

      if (!anime) {
        res.status(404).send("Anime not found");
        return;
      }

      res.json(anime);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in Anime by id");
    }
  } else if (req.query.title) {
    const title = req.query.title;

    try {
      const animes = await AnimeModel.find({
        title: { $regex: new RegExp(title, "i") },
      });

      res.json(animes);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in anime by title");
    }
  } else {
    try {
      const animes = await AnimeModel.find({});

      res.json(animes);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in getting All Animes");
    }
  }
});

module.exports = router;
