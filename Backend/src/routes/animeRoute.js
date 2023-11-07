const express = require("express");
const router = express.Router();
const getAnimes = require("../controllers/getAnimeData");

router.get("/animes", (req, res) => {
  res.json(getAnimes());
});

// router.get("/_id", (req, res) => {
//   res.json("");
// });
