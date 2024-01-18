const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");
const { validationResult, body } = require("express-validator");

router
  .route("/login")
  // /**
  //  * @route POST /auth/login
  //  * @group Auth - Operations about auth
  //  * @body {object} User.body.required - User info
  //  * @returns {object} 200 - User info
  //  * @returns {Error}  401 - Not Authorized
  //  * @returns {Error}  404 - Not Authorized
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .post(async (req, res) => {
    authController.loginUser(req, res);
  });

router
  .route("/register")
  // /**
  //  * @route POST /auth/register
  //  * @group Auth - Operations about auth
  //  * @body {object} User.body.required - User info
  //  * @returns {object} 201 - User info
  //  * @returns {Error}  406 - Duplicated User
  //  * @returns {Error}  500 - An error occurred
  //  * @security Bearer
  //  */
  .post(
    [
      body("fullname").notEmpty().escape(),
      body("username").notEmpty().escape(),
      body("password").notEmpty().escape(),
    ],
    function (req, res) {
      const errors = validationResult(req);
      if (errors.isEmpty()) {
        authController.signUpUser(req, res);
      } else {
        res.status(404).json({ errors: errors.array() });
      }
    }
  );

module.exports = router;
