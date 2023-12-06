const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");
const { validationResult, body } = require("express-validator");

router.route("/login").post(async (req, res) => {
  authController.loginUser(req, res);
});

router
  .route("/signup")
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

router.route("/logout").get(async (req, res) => {
  authController.logoutUser(req, res);
});

module.exports = router;
