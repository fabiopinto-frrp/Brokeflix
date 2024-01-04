var jwt = require("jsonwebtoken");
const user = require("../models/user.model");

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

    user.findOne({ username: loggedUser }, function (error, user) {
      if (error) {
        return res.status(500).json({ error: "Error finding user" });
      }

      if (!user) {
        return res.status(404).json({ error: "No user found" });
      }

      req.user = user;
      next();
    });
  });
};
