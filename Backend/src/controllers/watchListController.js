const user = require("../models/user.model");
const anime = require("../models/anime.model");
const serie = require("../models/serie.model");
const film = require("../models/film.model");

exports.getWatchList = async (req, res) => {
  const userProfile = await user.findOne({ username: req.user.username });

  res.json(userProfile.watchList);
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
    rating: req.body.rating,
  };

  if (animeToAdd) {
    obj.type = animeToAdd.type;
    obj.title = animeToAdd.title;
    obj.image = animeToAdd.imageUrl;
    obj.animeStatus = animeToAdd.status;
    obj.description = animeToAdd.description;
    obj.genres = animeToAdd.genres;
    obj.episodes = animeToAdd.numberOfEpisodes;
  }

  if (serieToAdd) {
    obj.type = serieToAdd.type;
    obj.title = serieToAdd.title;
    obj.image = serieToAdd.imageUrl;
    obj.seriesStatus = serieToAdd.status;
    obj.description = serieToAdd.description;
    obj.genres = serieToAdd.genres;
    obj.episodes = serieToAdd.numberOfEpisodes;
  }

  if (filmToAdd) {
    obj.type = filmToAdd.type;
    obj.title = filmToAdd.title;
    obj.image = filmToAdd.imageUrl;
    obj.description = filmToAdd.description;
    obj.genres = filmToAdd.genres;
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

  const mediaToEdit = userProfile.watchList.find(
    (media) => media.title === req.body.title && media.type === req.body.type
  );
  if (req.body.type === "Anime" || req.body.type === "Serie") {
    mediaToEdit.userStatus = req.body.userStatus;
    mediaToEdit.progress = req.body.progress;
    mediaToEdit.score = req.body.score;
  }
  if (req.body.type === "Film") {
    mediaToEdit.userStatus = req.body.userStatus;
    mediaToEdit.score = req.body.score;
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

  const mediaToDelete = userProfile.watchList.find(
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
