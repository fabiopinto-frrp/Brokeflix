const FilmModel = require("../models/film.model");
const express = require("express");
const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const films = await FilmModel.find({});
    res.json(films);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

router.get("/:id", async (req, res) => {
  const filmId = req.params.id;

  try {
    const film = await FilmModel.findById(filmId);
    if (!film) {
      res.status(404).send("film not found");
      return;
    }
    res.json(film);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

router.get("/:title", async (req, res) => {
  const title = req.params.title;

  try {
    const films = await FilmModel.find({
      title: { $regex: new RegExp(title, "i") }, // Case-insensitive search
    });
    res.json(films);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

module.exports = router;
