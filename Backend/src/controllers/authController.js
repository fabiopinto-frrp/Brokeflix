const express = require("express");
const router = express.Router();
const User = require("../models/user.model");
const ErrorHandler = require("../utils/errorHandler");

exports.signUpUser = async (req, res) => {
  const { fullname, email, password } = req.body;

  try {
    const user = await User.create({ fullname, email, password });
    res.status(201).json(user);
  } catch (err) {
    ErrorHandler.error(err);
    res.status(400).send("error: User not created");
  }
};

exports.loginUser = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.create({ fullname, email, password });
    res.status(201).json(user);
  } catch (err) {
    const errors = ErrorHandler.signUpError(err);
    res.status(400).json({ errors });
  }
};
