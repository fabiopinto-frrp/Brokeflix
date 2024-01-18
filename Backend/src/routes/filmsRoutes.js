const express = require("express");
const router = express.Router();
const filmController = require("../controllers/filmController");

router
  .route("/")
  /**
   * @route GET /api/films
   * @group Film - Operations about film
   * @param {string} title.query - film title
   * @param {string} id.query - film id
   * @returns {object} 200 - An array of films info
   * @returns {Error}  404 - Film not found
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .get(async (req, res) => {
    filmController.getFilms(req, res);
  })
  /**
   * @route POST /api/films
   * @group Film - Operations about film
   * @body {object} Film.body.required - Film info
   * @returns {object} 201 - Film info
   * @returns {Error}  406 - Film Duplicated
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .post(async (req, res) => {
    filmController.postFilm(req, res);
  });
router
  .route("/random/:count")
  /**
   * @route GET /api/films/random/{count}
   * @group Film - Operations about film
   * @param {integer} count.path.required - count of random films
   * @returns {object} 200 - An array of random films info
   * @returns {Error}  404 - Film not found
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .get(async (req, res) => {
    filmController.random(req, res);
  });

router
  .route("/genres/:genres")
  /**
   * @route GET /api/films/genres/{genres}
   * @group Film - Operations about film
   * @param {string} genres.param - film genres
   * @returns {object} 200 - An array of film info
   * @returns {Error}  404 - Film not found
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .get(async (req, res) => {
    filmController.getFilmsByGenres(req, res);
  });
router
  .route("/:title")
  /**
   * @route PUT /api/films/{title}
   * @group Film - Operations about film
   * @param {string} title.path.required - film title
   * @body {object} Film.body.required - Film info
   * @returns {object} 201 - Film info
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .put(async (req, res) => {
    filmController.putFilm(req, res);
  })
  /**
   * @route DELETE /api/films/{title}
   * @group Film - Operations about film
   * @param {string} title.path.required - film title
   * @returns {object} 200 - Film info
   * @returns {Error}  404 - Film not found
   * @returns {Error}  500 - An error occurred
   * @security Bearer
   */
  .delete(async (req, res) => {
    filmController.deleteFilm(req, res);
  });

module.exports = router;
