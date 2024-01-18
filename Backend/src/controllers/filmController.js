const FilmModel = require("../models/film.model");

exports.getFilms = async (req, res) => {
  if (req.query.id) {
    const filmId = req.query.id;

    try {
      const film = await FilmModel.findById(filmId);

      if (!film) {
        res.status(404).send("film not found");
        return;
      }

      res.json(film);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in Film by id");
    }
  } else if (req.query.title) {
    const title = req.query.title;

    try {
      const films = await FilmModel.find({
        title: { $regex: new RegExp(title, "i") },
      });

      res.json(films);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in Film by title");
    }
  } else {
    try {
      const films = await FilmModel.find({});

      res.json(films);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in getting All Films");
    }
  }
};

exports.postFilm = async (req, res) => {
  let postFilm = {
    title: req.body.title,
    description: req.body.description,
    genres: req.body.genres,
    status: req.body.status,
    imageUrl: req.body.imageUrl,
    backgroundImgUrl: req.body.backgroundImgUrl,
    videosUrl: req.body.videosUrl ? req.body.videosUrl : "",
  };

  const duplicate = await FilmModel.findOne({ title: postFilm.title });

  if (duplicate) {
    res.status(406).send("Film already exists");
    return;
  }

  const film = new FilmModel(postFilm);

  try {
    await film.save();
    res.status(201).json(film);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in saving Film");
  }
};

exports.putFilm = async (req, res) => {
  let title = req.params.title;

  let film = await FilmModel.findOne({ title: title });

  let updateFilm = {
    type: film.type,
    title: req.body.title ? req.body.title : film.title,
    description: req.body.description ? req.body.description : film.description,
    genres: req.body.genres ? req.body.genres : film.genres,
    imageUrl: req.body.imageUrl ? req.body.imageUrl : film.imageUrl,
    status: req.body.status ? req.body.status : film.status,
    backgroundImgUrl: req.body.backgroundImgUrl
      ? req.body.backgroundImgUrl
      : film.backgroundImgUrl,
    videosUrl: req.body.videosUrl ? req.body.videosUrl : film.videosUrl,
  };

  try {
    const film = await FilmModel.updateOne({ title: title }, updateFilm);

    res.status(201).json(film);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in updating Film");
  }
};

exports.deleteFilm = async (req, res) => {
  const filmTitle = req.params.title;

  try {
    const film = await FilmModel.deleteOne({ title: filmTitle });

    if (!film) {
      res.status(404).send("Film not found");
      return;
    }
    res.status(200).json(film);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in deleting film by title");
  }
};

exports.random = async (req, res) => {
  const count = parseInt(req.params.count, 10);
  try {
    const films = await FilmModel.aggregate([{ $sample: { size: count } }]);
    if (!films || films.length === 0) {
      res.status(404).send("Film not found");
      return;
    }
    res.status(200).json(films);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in getting random films");
  }
};
