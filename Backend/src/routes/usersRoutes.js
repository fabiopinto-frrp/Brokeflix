const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");
const watchListController = require("../controllers/watchListController");
const middleware = require("../middlewares/validateToken");

router
  .route("/")
  /**
   * @route GET /api/users
   * @group User - Operations about user
   * @param {string} username.query - user username
   * @param {string} id.query - user id
   * @returns {object} 200 - An array of users info
   * @returns {Error}  404 - User not found
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .get(async (req, res) => {
    userController.getUsers(req, res);
  });

router
  .route("/:username/profile")
  /**
   * @route GET /api/users/{username}/profile
   * @group User - Operations about user
   * @param {string} username.path.required - user username
   * @returns {object} 200 - User info
   * @returns {Error}  401 - Not Authorized
   * @returns {Error}  404 - User not found
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .get(middleware.validateToken, async (req, res) => {
    console.log("Entra");
    userController.getProfile(req, res);
  })
  /**
   * @route PUT /api/users/{username}/profile
   * @group User - Operations about user
   * @param {string} username.path.required - user username
   * @body {object} User.body.required - User info
   * @returns {object} 200 - User info
   * @returns {Error}  401 - Not Authorized
   * @returns {Error}  404 - User not found
   * @security Bearer
   */
  .put(middleware.validateToken, async (req, res) => {
    userController.updateProfile(req, res);
  });

router
  .route("/:username/watchList")
  /**
   * @route GET /api/users/{username}/watchList
   * @group User - Operations about user
   * @param {string} username.path.required - user username
   * @returns {object} 200 - User watchList
   * @returns {Error}  404 - User not found
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .get(middleware.validateToken, async (req, res) => {
    watchListController.getWatchList(req, res);
  })
  /**
   * @route POST /api/users/{username}/watchList
   * @group User - Operations about user
   * @param {string} username.path.required - user username
   * @body {object} Media.body.required - Media info
   * @returns {object} 200 - User watchList
   * @returns {Error}  400 - An error occurred
   * @security Bearer
   */
  .post(middleware.validateToken, async (req, res) => {
    watchListController.addMedia(req, res);
  });

router
  .route("/:username/watchList/:type/:title")
  /**
   * @route PUT /api/users/{username}/watchList/{type}/{title}
   * @group User - Operations about user
   * @param {string} username.path.required - user username
   * @param {string} type.path.required - media type
   * @param {string} title.path.required - media title
   * @body {object} Media.body.required - Media info
   * @returns {object} 200 - User watchList
   * @returns {Error}  400 - An error occurred
   * @security Bearer
   */
  .put(middleware.validateToken, async (req, res) => {
    watchListController.editMedia(req, res);
  })
  /**
   * @route DELETE /api/users/{username}/watchList/{type}/{title}
   * @group User - Operations about user
   * @param {string} username.path.required - user username
   * @param {string} type.path.required - media type
   * @param {string} title.path.required - media title
   * @returns {object} 200 - User watchList
   * @returns {Error}  400 - An error occurred
   * @security Bearer
   */
  .delete(middleware.validateToken, async (req, res) => {
    watchListController.deleteMedia(req, res);
  });

module.exports = router;
