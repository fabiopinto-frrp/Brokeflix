const SerieModel = require("../models/serie.model");
const express = require("express");

exports.getSeries = async (req, res) => {
  if (req.query.id) {
    const serieId = req.query.id;

    try {
      const serie = await SerieModel.findById(serieId);

      if (!serie) {
        res.status(404).send("serie not found");
        return;
      }

      res.json(serie);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in serie by id");
    }
  } else if (req.query.title) {
    const title = req.query.title;

    try {
      const series = await SerieModel.find({
        title: { $regex: new RegExp(title, "i") },
      });

      res.json(series);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in serie by title");
    }
  } else {
    try {
      const series = await SerieModel.find({});

      res.json(series);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in getting All series");
    }
  }
};

exports.postSerie = async (req, res) => {
  let postSerie = {
    title: req.body.title,
    episodes: req.body.episodes ? req.body.episodes : "?",
    description: req.body.description,
    status: req.body.status,
    genres: req.body.genres,
    imageUrl: req.body.imageUrl,
    backgroundImgUrl: req.body.backgroundImgUrl,
    videosUrl: req.body.videosUrl ? req.body.videosUrl : [],
  };

  const duplicate = await SerieModel.findOne({ title: postSerie.title });

  if (duplicate) {
    res.status(409).send("Serie already exists");
    return;
  }

  try {
    const serie = await SerieModel.create(postSerie);

    res.json(serie);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in creating serie");
  }
};

exports.putSerie = async (req, res) => {
  let title = req.params.title;

  let serie = await SerieModel.findOne({ title: title });

  let updateSerie = {
    title: req.body.title,
    episodes: req.body.episodes ? req.body.episodes : serie.episodes,
    description: req.body.description
      ? req.body.description
      : serie.description,
    status: req.body.status ? req.body.status : serie.status,
    genres: req.body.genres ? req.body.genres : serie.genres,
    imageUrl: req.body.imageUrl ? req.body.imageUrl : serie.imageUrl,
    backgroundImgUrl: req.body.backgroundImgUrl
      ? req.body.backgroundImgUrl
      : serie.backgroundImgUrl,
    videosUrl: req.body.videosUrl ? req.body.videosUrl : serie.videosUrl,
  };
  try {
    const serie = await SerieModel.updateOne({ title: title }, updateSerie);

    res.json(serie);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in updating Serie");
  }
};

exports.deleteSerie = async (req, res) => {
  const serieTitle = req.params.title;

  try {
    const serie = await SerieModel.deleteOne({ title: serieTitle });

    if (!serie) {
      res.status(404).send("Serie not found");
      return;
    }
    res.json(serie);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in deleting serie by title");
  }
};
