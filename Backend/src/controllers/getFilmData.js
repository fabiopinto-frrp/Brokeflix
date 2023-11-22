const FilmModel = require("../models/film.model");
const express = require("express");
const router = express.Router();

router.get("/", async (req, res) => {
  if (req.query.id) {
    const filmId = req.query.id;

    try {
      const film = await FilmModel.findById(filmId);

      if (!film) {
        res.status(404).send("film not found");
        return;
      }

      res.json(film);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in Film by id");
    }
  } else if (req.query.title) {
    const title = req.query.title;

    try {
      const films = await FilmModel.find({
        title: { $regex: new RegExp(title, "i") },
      });

      res.json(films);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in Film by title");
    }
  } else {
    try {
      const films = await FilmModel.find({});

      res.json(films);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in getting All Films");
    }
  }
});

module.exports = router;
