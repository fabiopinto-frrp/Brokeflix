var jwt = require("jsonwebtoken");
const userModel = require("../models/user.model");
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
  let decoded = jwt.verify(token.replace("Bearer ", ""), secret);
  let loggedUser = decoded.data.user;

  console.log(decoded.data.user);
  let user_info = userModel.findOne({ username: loggedUser }).then((user) => {
    if (user_info) {
      console.log(user);
      return callback(true, loggedUser);
    } else {
      return callback(false, null);
    }
  });
};
