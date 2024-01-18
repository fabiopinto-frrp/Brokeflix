const express = require("express");
const router = express.Router();
const serieController = require("../controllers/serieController");

router
  .route("/")
  // /**
  //  * @route GET /api/series
  //  * @group Serie - Operations about serie
  //  * @param {?string} title.query - serie title
  //  * @param {?string} id.query - serie id
  //  * @returns {object} 200 - An array of series info
  //  * @returns {Error}  404 - Serie not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .get(async (req, res) => {
    serieController.getSeries(req, res);
  })
  // /**
  //  * @route POST /api/series
  //  * @group Serie - Operations about serie
  //  * @body {object} Serie.body.required - Serie info
  //  * @returns {object} 201 - Serie info
  //  * @returns {Error}  406 - Serie Duplicated
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .post(async (req, res) => {
    serieController.postSerie(req, res);
  });

router
  .route("/genres/:genres")
  // /**
  //  * @route GET /api/series/genres/{genres}
  //  * @group Serie - Operations about serie
  //  * @param {string} genres.param - serie genres
  //  * @returns {object} 200 - An array of serie info
  //  * @returns {Error}  404 - Serie not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .get(async (req, res) => {
    serieController.getSeriesByGenres(req, res);
  });

router
  .route("/:title")
  // /**
  //  * @route POST /api/series/{title}
  //  * @group Serie - Operations about serie
  //  * @param {string} title.path.required - serie title
  //  * @body {object} Episode.body.required - Episode info
  //  * @returns {object} 201 - Episode info
  //  * @returns {Error}  409 - Episode Duplicated
  //  * @returns {Error}  404 - Episode not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .post(async (req, res) => {
    serieController.addEpisode(req, res);
  })
  // /**
  //  * @route PUT /api/series/{title}
  //  * @group Serie - Operations about serie
  //  * @param {string} title.path.required - serie title
  //  * @body {object} Serie.body.required - Serie info
  //  * @returns {object} 201 - Serie info
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .put(async (req, res) => {
    serieController.putSerie(req, res);
  })
  // /**
  //  * @route DELETE /api/series/{title}
  //  * @group Serie - Operations about serie
  //  * @param {string} title.path.required - serie title
  //  * @returns {object} 200 - Serie info
  //  * @returns {Error}  404 - Serie not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .delete(async (req, res) => {
    serieController.deleteSerie(req, res);
  });

router
  .route("/random/:count")
  // /**
  //  * @route GET /api/series/random/{count}
  //  * @group Serie - Operations about serie
  //  * @param {integer} count.path.required - count of random series
  //  * @returns {object} 200 - An array of random series info
  //  * @returns {Error}  404 - Serie not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .get(async (req, res) => {
    serieController.random(req, res);
  });

module.exports = router;
