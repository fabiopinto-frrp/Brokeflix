const FilmModel = require("../models/film.model");
const express = require("express");

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
    episodes: req.body.episodes ? req.body.episodes : "?",
    description: req.body.description,
    status: req.body.status,
    genres: req.body.genres,
    imageUrl: req.body.imageUrl,
    backgroundImgUrl: req.body.backgroundImgUrl,
    videosUrl: req.body.videosUrl ? req.body.videosUrl : [],
  };

  const duplicate = await FilmModel.findOne({ title: postFilm.title });

  if (duplicate) {
    res.status(409).send("Film already exists");
    return;
  }

  const film = new FilmModel(postFilm);

  try {
    await film.save();
    res.json(film);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in saving Film");
  }
};

exports.putFilm = async (req, res) => {
  let title = req.params.title;

  let film = await AnimeModel.findOne({ title: title });

  let updateFilm = {
    title: req.body.title,
    episodes: req.body.episodes ? req.body.episodes : film.episodes,
    description: req.body.description ? req.body.description : film.description,
    status: req.body.status ? req.body.status : film.status,
    genres: req.body.genres ? req.body.genres : film.genres,
    imageUrl: req.body.imageUrl ? req.body.imageUrl : film.imageUrl,
    backgroundImgUrl: req.body.backgroundImgUrl
      ? req.body.backgroundImgUrl
      : film.backgroundImgUrl,
    videosUrl: req.body.videosUrl ? req.body.videosUrl : film.videosUrl,
  };

  try {
    const film = await AnimeModel.updateOne({ title: title }, updateFilm);

    res.json(film);
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
    res.json(film);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in deleting film by title");
  }
};
