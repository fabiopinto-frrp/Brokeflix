const express = require("express");
const router = express.Router();
const serieController = require("../controllers/serieController");

router
  .route("/")
  .get(async (req, res) => {
    serieController.getSeries(req, res);
  })
  .post(async (req, res) => {
    serieController.postSerie(req, res);
  });

router
  .route("/:title")
  .put(async (req, res) => {
    serieController.putSerie(req, res);
  })
  .delete(async (req, res) => {
    serieController.deleteSerie(req, res);
  });

module.exports = router;
