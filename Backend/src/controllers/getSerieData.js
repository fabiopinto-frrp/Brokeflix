const SerieModel = require("../models/serie.model");
const express = require("express");
const router = express.Router();

router.get("/", async (req, res) => {
  if (req.query.id) {
    const serieId = req.query.id;

    try {
      const serie = await SerieModel.findById(serieId);

      if (!serie) {
        res.status(404).send("serie not found");
        return;
      }

      res.json(serie);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in serie by id");
    }
  } else if (req.query.title) {
    const title = req.query.title;

    try {
      const series = await SerieModel.find({
        title: { $regex: new RegExp(title, "i") },
      });

      res.json(series);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in serie by title");
    }
  } else {
    try {
      const series = await SerieModel.find({});

      res.json(series);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in getting All series");
    }
  }
});

module.exports = router;
