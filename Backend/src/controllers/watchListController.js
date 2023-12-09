const user = require("../models/user.model");
const anime = require("../models/anime.model");
const serie = require("../models/serie.model");
const film = require("../models/film.model");

exports.getWatchList = async (req, res) => {
  const userProfile = await user.findOne({ username: req.user.username });

  res.json(userProfile.watchList);
};

exports.addMedia = async (req, res) => {
  const userProfile = await user.findOne({ username: req.user.username });
  const animeToAdd = await anime.findOne({ title: req.body.title });
  const serieToAdd = await serie.findOne({ title: req.body.title });
  const filmToAdd = await film.findOne({ title: req.body.title });

  userProfile.watchList.push({
    type: "Anime" || "Serie" || "Film",
    title: animeToAdd.title || serieToAdd.title || filmToAdd.title,
    image: animeToAdd.imageUrl || serieToAdd.imageUrl || filmToAdd.imageUrl,
    animeStatus: animeToAdd.status || serieToAdd.status || filmToAdd.status,
    userStatus: req.body.userStatus,
    progress: req.body.progress,
    description:
      animeToAdd.description || serieToAdd.description || filmToAdd.description,
    genres: animeToAdd.genres || serieToAdd.genres || filmToAdd.genres,
    rating: req.body.rating,
    episodes:
      animeToAdd.numberOfEpisodes ||
      serieToAdd.numberOfEpisodes ||
      filmToAdd.numberOfEpisodes,
  });
  try {
    await userProfile.save();

    res.status(200).send("Media added to watch list successfully");
  } catch (err) {
    res.status(400).send("Error adding media to watch list");
  }
};

exports.editMedia = async (req, res) => {
  const userProfile = await user.findOne({ username: req.user.username });

  const mediaToEdit = userProfile.watchList.find(
    (media) => media.title === req.body.title
  );

  mediaToEdit.progress = req.body.progress;
  mediaToEdit.rating = req.body.rating;
  try {
    await userProfile.save();

    res.status(200).send("Media updated successfully");
  } catch (err) {
    res.status(400).send("Error updating Media");
  }
};

exports.deleteMedia = async (req, res) => {
  const userProfile = await user.findOne({ username: req.user.username });

  const mediaToDelete = userProfile.watchList.find(
    (media) => media.title === req.body.title
  );
  try {
    mediaToDelete.remove();

    await userProfile.save();

    res.status(200).send("Media deleted from watch list successfully");
  } catch (err) {
    res.status(400).send("Error deleting Media");
  }
};
