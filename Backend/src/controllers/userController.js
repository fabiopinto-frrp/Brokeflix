const UserModel = require("../models/user.model");

exports.getUsers = async (req, res) => {
  if (req.query.id) {
    const userId = req.query.id;

    try {
      const user = await UserModel.findById(userId);

      if (!user) {
        res.status(404).send("User not found");
        return;
      }
      let userToSend = {
        username: user.username,
        avatar: user.avatar,
        fullName: user.fullName,
        isAdmin: user.isAdmin,
      };

      res.status(200).json(userToSend);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in User by id");
    }
  } else if (req.query.username) {
    try {
      const users = await UserModel.find({
        username: { $regex: new RegExp(username, "i") },
      });

      let userToSend = {
        username: users.username,
        avatar: users.avatar,
        fullName: users.fullName,
        isAdmin: users.isAdmin,
      };

      res.status(200).json(userToSend);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in user by username");
    }
  } else {
    try {
      const users = await UserModel.find({ username: req.user.username });

      res.status(200).json(users);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in getting All Users");
    }
  }
};

exports.getProfile = async (req, res) => {
  try {
    const userProfile = await UserModel.findOne({
      username: req.params.username,
    });

    if (req.loggedInUser !== userProfile.username) {
      return res.status(401).send("Not Authorized");
    }

    res.status(200).json(userProfile);
  } catch (err) {
    res.status(404).send("Error getting profile");
  }
};

exports.updateProfile = async (req, res) => {
  const userProfile = await UserModel.findOne({
    username: req.params.username,
  });

  if (req.user.username !== userProfile.username) {
    return res.status(401).send("Not Authorized");
  }

  try {
    userProfile.avatar = req.body.avatar ? req.body.avatar : userProfile.avatar;
    userProfile.fullName = req.body.fullName
      ? req.body.fullName
      : userProfile.fullName;
    await userProfile.save();
    res.status(201).send("Profile updated successfully");
  } catch (err) {
    res.status(404).send("Error updating profile");
  }
};
