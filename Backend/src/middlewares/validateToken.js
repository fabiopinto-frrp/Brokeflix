var jwt = require("jsonwebtoken");
const userModel = require("../models/user.model");

let secret = process.env.JWT_SECRET;
exports.validateToken = (req, res, next) => {
  const token = req.headers["authorization"];

  if (!token) {
    return res.status(401).json({ error: "No token provided" });
  }

  jwt.verify(token.replace("Bearer ", ""), secret, function (error, decoded) {
    if (error) {
      return res.status(403).json({ error: "Failed to authenticate token" });
    }

    let loggedUser = decoded.data.user;

    userModel
      .findOne({ username: loggedUser })
      .then((info) => {
        if (info) {
          req.user = info;
          next();
        } else {
          return res.status(404).json({ error: "No user found" });
        }
      })
      .catch((err) => {
        console.log(err);
        return res.status(500).json({ error: "Error finding user" });
      });
  });
};
