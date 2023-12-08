const express = require("express");
const router = express.Router();
const animeController = require("../controllers/animeController");

router
  .route("/")
  .get(async (req, res) => {
    animeController.getAnimes(req, res);
  })
  .post(async (req, res) => {
    animeController.postAnime(req, res);
  });

router
  .route("/:title")
  .post(async (req, res) => {
    animeController.addEpisode(req, res);
  })
  .put(async (req, res) => {
    animeController.putAnime(req, res);
  })
  .delete(async (req, res) => {
    animeController.deleteAnime(req, res);
  });

router.route("/episode/:title");

module.exports = router;
