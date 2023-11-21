const AnimeModel = require("../models/anime.model");
const express = require("express");
const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const animes = await AnimeModel.find({});
    res.json(animes);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

// Route to search anime by ID
router.get("/:id", async (req, res) => {
  const animeId = req.params.id; // Accesses anime ID from URL parameter

  try {
    const anime = await AnimeModel.findById(animeId); // Fetches anime by ID
    if (!anime) {
      res.status(404).send("Anime not found");
      return;
    }
    res.json(anime);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

// Route to search anime by title
router.get("/:title", async (req, res) => {
  const title = req.params.title; // Accesses anime title from URL parameter

  try {
    const animes = await AnimeModel.find({
      title: { $regex: new RegExp(title, "i*") },
    }); // Case-insensitive search
    res.json(animes);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

module.exports = router;
