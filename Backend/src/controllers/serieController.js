const SerieModel = require("../models/serie.model");

exports.getSeries = async (req, res) => {
  if (req.query.id) {
    const serieId = req.query.id;

    try {
      const serie = await SerieModel.findById(serieId);

      if (!serie) {
        res.status(404).send("serie not found");
        return;
      }

      res.status(200).json(serie);
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

      res.status(200).json(series);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in serie by title");
    }
  } else {
    try {
      const series = await SerieModel.find({});

      res.status(200).json(series);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in getting All series");
    }
  }
};

exports.postSerie = async (req, res) => {
  let postSerie = {
    title: req.body.title,
    numberOfEpisodes: req.body.numberOfEpisodes
      ? req.body.numberOfEpisodes
      : "?",
    episode: req.body.episode ? req.body.episode : [],
    description: req.body.description,
    status: req.body.status,
    genres: req.body.genres,
    imageUrl: req.body.imageUrl,
    backgroundImgUrl: req.body.backgroundImgUrl,
  };

  const duplicate = await SerieModel.findOne({ title: postSerie.title });

  if (duplicate) {
    res.status(406).send("Serie already exists");
    return;
  }

  try {
    const serie = await SerieModel.create(postSerie);

    res.status(201).json(serie);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in creating serie");
  }
};

exports.putSerie = async (req, res) => {
  let title = req.params.title;

  let serie = await SerieModel.findOne({ title: title });

  let updateSerie = {
    type: serie.type,
    title: req.body.title,
    numberOfEpisodes: req.body.numberOfEpisodes
      ? req.body.numberOfEpisodes
      : serie.numberOfEpisodes,
    episode: req.body.episode ? req.body.episode : serie.episode,
    description: req.body.description
      ? req.body.description
      : serie.description,
    status: req.body.status ? req.body.status : serie.status,
    genres: req.body.genres ? req.body.genres : serie.genres,
    imageUrl: req.body.imageUrl ? req.body.imageUrl : serie.imageUrl,
    backgroundImgUrl: req.body.backgroundImgUrl
      ? req.body.backgroundImgUrl
      : serie.backgroundImgUrl,
  };
  try {
    const serie = await SerieModel.updateOne({ title: title }, updateSerie);

    res.status(201).json(serie);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in updating Serie");
  }
};

exports.addEpisode = async (req, res) => {
  let title = req.params.title;
  const episode = req.body.episode;
  const duplicate = await SerieModel.findOne({ episode: episode.title });
  const serie = await SerieModel.findOne({ title: title });

  let completedEpisode = {
    imageUrl: serie.imageUrl,
    title: episode.title,
    epUrl: episode.epUrl,
  };

  if (duplicate) {
    res.status(406).send("Episode already exists");
    return;
  } else {
    try {
      if (!serie) {
        res.status(404).send("Serie not found");
        return;
      }

      serie.episode.push(completedEpisode);

      await serie.save();

      res.json(serie);
    } catch (err) {
      console.error(err);
      res.status(500).send("An error occurred in adding episode");
    }
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
    res.status(200).json(serie);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in deleting serie by title");
  }
};

exports.random = async (req, res) => {
  const count = parseInt(req.params.count, 10);
  try {
    const series = await SerieModel.aggregate([{ $sample: { size: count } }]);
    if (!series || series.length === 0) {
      res.status(404).send("Serie not found");
      return;
    }
    res.status(200).json(series);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred in getting random series");
  }
};
