const express = require("express");
const router = express.Router();

router.use("*", (req, res) => {
  res.redirect("/api/animes");
});

module.exports = router;
