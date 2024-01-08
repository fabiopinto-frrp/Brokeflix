const bcrypt = require("bcrypt");
const user = require("../models/user.model");
const jwtAuthorization = require("../utils/jwtAuthorization");

exports.signUpUser = async (req, res) => {
  try {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(req.body.password, salt);

    const existingUser = await user.find({ username: req.body.username });

    if (existingUser.length > 0) {
      return res.status(406).send("Duplicated User");
    }

    const userToCreate = new user({
      fullname: req.body.fullname,
      username: req.body.username,
      password: hash,
      watchList: [],
    });

    const newUser = await userToCreate.save();
    res.status(201).json(newUser);
  } catch (err) {
    res.status(500).send(err);
  }
};
exports.loginUser = async (req, res) => {
  try {
    const users = await user.find({ username: req.body.username });

    if (users.length > 0) {
      const match = await bcrypt.compare(req.body.password, users[0].password);

      if (match) {
        jwtAuthorization.generateToken(
          { user: req.body.username },
          function (err, token) {
            if (err) {
              res.status(500).send(err);
            } else {
              res.status(200).json({ token: token });
            }
          }
        );
      } else {
        res.status(401).send("Not Authorized");
      }
    } else {
      res.status(404).send("Not Authorized");
    }
  } catch (err) {
    res.status(500).send(err);
  }
};
