const express = require("express");
const router = express.Router();
const filmController = require("../controllers/filmController");

router
  .route("/")
  .get(async (req, res) => {
    filmController.getFilms(req, res);
  })
  .post(async (req, res) => {
    filmController.postFilm(req, res);
  });

router
  .route("/:title")
  .put(async (req, res) => {
    filmController.putFilm(req, res);
  })
  .delete(async (req, res) => {
    filmController.deleteFilm(req, res);
  });

module.exports = router;
