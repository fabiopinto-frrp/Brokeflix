const express = require("express");
const router = express.Router();
const userController = require("./controllers/userController");
const watchListController = require("./controllers/watchListController");

router.route("/").get(async (req, res) => {
  userController.getUsers(req, res);
});

router
  .route("/:username/profile")
  .get(async (req, res) => {
    userController.getProfile(req, res);
  })
  .put(async (req, res) => {
    userController.updateProfile(req, res);
  });

router
  .route("/:username/watchList")
  .get(async (req, res) => {
    watchListController.getWatchList(req, res);
  })
  .post(async (req, res) => {
    watchListController.addMedia(req, res);
  })
  .put(async (req, res) => {
    watchListController.editMedia(req, res);
  })
  .delete(async (req, res) => {
    watchListController.deleteMedia(req, res);
  });

module.exports = router;
