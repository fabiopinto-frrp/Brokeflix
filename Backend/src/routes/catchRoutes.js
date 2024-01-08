const express = require("express");
const router = express.Router();

router.use("*", (req, res) => {
  res.redirect("/api/docs");
});

module.exports = router;
