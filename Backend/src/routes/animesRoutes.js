const express = require("express");
const router = express.Router();
const animeController = require("../controllers/animeController");

router
  .route("/")
  // /**
  //  * @route GET /api/animes
  //  * @group Anime - Operations about anime
  //  * @query {string} title.query - anime title
  //  * @query {string} id.query - anime id
  //  * @returns {object} 200 - An array of anime info
  //  * @returns {Error}  404 - Anime not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .get(async (req, res) => {
    animeController.getAnimes(req, res);
  })
  // /**
  //  * @route POST /api/animes
  //  * @group Anime - Operations about anime
  //  * @body {object} Anime.body.required - Anime info
  //  * @returns {object} 201 - Anime info
  //  * @returns {Error}  409 - Anime Duplicated
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .post(async (req, res) => {
    animeController.postAnime(req, res);
  });

router
  .route("/random/:count")
  // /**
  //  * @route GET /api/animes/random/{count}
  //  * @group Anime - Operations about anime
  //  * @param {integer} count.path.required - count of random animes
  //  * @returns {object} 200 - An array of random animes info
  //  * @returns {Error}  404 - Anime not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .get(async (req, res) => {
    animeController.random(req, res);
  });

router
  .route("/:title")
  // /**
  //  * @route POST /api/animes/{title}
  //  * @group Anime - Operations about anime
  //  * @param {string} title.path.required - anime title
  //  * @body {object} Episode.body.required - Episode info
  //  * @returns {object} 201 - Episode info
  //  * @returns {Error}  409 - Episode Duplicated
  //  * @returns {Error}  404 - Episode not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .post(async (req, res) => {
    animeController.addEpisode(req, res);
  })
  // /**
  //  * @route PUT /api/animes/{title}
  //  * @group Anime - Operations about anime
  //  * @param {string} title.path.required - anime title
  //  * @body {object} Anime.body.required - Anime info
  //  * @returns {object} 200 - Anime info
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .put(async (req, res) => {
    animeController.putAnime(req, res);
  })
  // /**
  //  * @route DELETE /api/animes/{title}
  //  * @group Anime - Operations about anime
  //  * @param {string} title.path.required - anime title
  //  * @returns {object} 200 - Anime info
  //  * @returns {Error}  404 - Anime not found
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .delete(async (req, res) => {
    animeController.deleteAnime(req, res);
  });

module.exports = router;
