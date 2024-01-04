const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");
const watchListController = require("../controllers/watchListController");
const middleware = require("../middlewares/validateToken");

router.route("/").get(async (req, res) => {
  userController.getUsers(req, res);
});

router
  .route("/:username/profile")
  .get(middleware.validateToken, async (req, res) => {
    userController.getProfile(req, res);
  })
  .put(middleware.validateToken, async (req, res) => {
    userController.updateProfile(req, res);
  });

router
  .route("/:username/watchList")
  .get(middleware.validateToken, async (req, res) => {
    watchListController.getWatchList(req, res);
  })
  .post(middleware.validateToken, async (req, res) => {
    watchListController.addMedia(req, res);
  });

router
  .route("/:username/watchList/:type/:title")
  .put(middleware.validateToken, async (req, res) => {
    watchListController.editMedia(req, res);
  })
  .delete(middleware.validateToken, async (req, res) => {
    watchListController.deleteMedia(req, res);
  });

module.exports = router;
