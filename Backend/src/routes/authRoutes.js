const express = require("express");
const router = express.Router();
const authController = require("../controllers/authController");

router.route("/login").post(async (req, res) => {
  authController.loginUser(req, res);
});

router.route("/signup").post(async (req, res) => {
  authController.signUpUser(req, res);
});

router.route("/logout").get(async (req, res) => {
  authController.logoutUser(req, res);
});
