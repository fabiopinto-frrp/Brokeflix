var jwt = require("jsonwebtoken");
const user = require("../models/user.model");
let secret = process.env.JWT_SECRET;

exports.generateToken = (user_info, callback) => {
  let token = jwt.sign(
    {
      data: user_info,
    },
    secret,
    { expiresIn: "31d" }
  );
  return callback(token);
};

exports.validateToken = (token, callback) => {
  if (!token) {
    return callback(false, null);
  }
  jwt.verify(token.replace("Bearer ", ""), secret, function (error, decoded) {
    let loggedUser = decoded.data.user;

    user.findOne({ username: loggedUser }, function (error, user) {
      if (user) {
        return callback(true, loggedUser);
      } else {
        return callback(false, null);
      }
    });
  });
};
