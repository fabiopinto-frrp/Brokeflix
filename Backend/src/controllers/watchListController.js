const user = require("../models/user.model");
const anime = require("../models/anime.model");
const serie = require("../models/serie.model");
const film = require("../models/film.model");

exports.getWatchList = async (req, res) => {
  try {
    const userProfile = await user.findOne({ username: req.user.username });
    if (!userProfile) {
      return res.status(404).send("User not found");
    }
    res.status(200).json(userProfile.watchList);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in getting watch list");
  }
};

exports.addMedia = async (req, res) => {
  const type = req.body.type;
  const userProfile = await user.findOne({ username: req.user.username });
  const animeToAdd = await anime.findOne({ type: type });
  const serieToAdd = await serie.findOne({ type: type });
  const filmToAdd = await film.findOne({ type: type });

  let obj = {
    type: req.body.type,
    userStatus: req.body.userStatus,
    progress: req.body.progress,
    score: req.body.score,
  };

  if (animeToAdd) {
    obj.type = animeToAdd.type;
    obj.title = animeToAdd.title;
    obj.image = animeToAdd.imageUrl;
    // obj.genres = animeToAdd.genres;
    obj.numberOfEpisodes = animeToAdd.numberOfEpisodes;
  }

  if (serieToAdd) {
    obj.type = serieToAdd.type;
    obj.title = serieToAdd.title;
    obj.image = serieToAdd.imageUrl;

    // obj.genres = serieToAdd.genres;
    obj.numberOfEpisodes = serieToAdd.numberOfEpisodes;
  }

  if (filmToAdd) {
    obj.type = filmToAdd.type;
    obj.title = filmToAdd.title;
    obj.image = filmToAdd.imageUrl;
    // obj.genres = filmToAdd.genres;
  }

  try {
    userProfile.watchList.push(obj);
    await userProfile.save();

    res.status(200).send("Media added to watch list successfully");
  } catch (err) {
    res.status(400).send("Error adding media to watch list");
  }
};

exports.editMedia = async (req, res) => {
  const userProfile = await user.findOne({ username: req.user.username });

  const mediaToEdit = userProfile.watchList.findIndex(
    (media) => media.title === req.body.title && media.type === req.body.type
  );
  if (req.body.type === "Anime" || req.body.type === "Serie") {
    mediaToEdit.userStatus = req.body.userStatus
      ? req.body.userStatus
      : mediaToEdit.userStatus;
    mediaToEdit.progress = req.body.progress
      ? req.body.progress
      : mediaToEdit.progress;
    mediaToEdit.score = req.body.score ? req.body.score : mediaToEdit.score;
  }
  if (req.body.type === "Film") {
    mediaToEdit.userStatus = req.body.userStatus
      ? req.body.userStatus
      : mediaToEdit.userStatus;
    mediaToEdit.score = req.body.score ? req.body.score : mediaToEdit.score;
  }

  try {
    await mediaToEdit.save();
    res.status(200).send("Media updated successfully");
  } catch (err) {
    res.status(400).send("Error updating Media");
  }
};

exports.deleteMedia = async (req, res) => {
  const userProfile = await user.findOne({ username: req.user.username });

  const mediaToDelete = userProfile.watchList.findIndex(
    (media) => media.title === req.body.title && media.type === req.body.type
  );
  try {
    mediaToDelete.remove();

    await userProfile.save();

    res.status(200).send("Media deleted from watch list successfully");
  } catch (err) {
    res.status(400).send("Error deleting Media");
  }
};
