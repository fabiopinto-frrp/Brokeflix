const SerieModel = require("../models/serie.model");
const router = express.Router();

router.get("/", async (req, res) => {
  try {
    const series = await SerieModel.find({});
    res.json(series);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

router.get("/:id", async (req, res) => {
  const serieId = req.params.id;

  try {
    const serie = await SerieModel.findById(serieId);
    if (!serie) {
      res.status(404).send("serie not found");
      return;
    }
    res.json(serie);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

router.get("/:title", async (req, res) => {
  const title = req.params.title;

  try {
    const series = await SerieModel.find({
      title: { $regex: new RegExp(title, "i") }, // Case-insensitive search
    });
    res.json(series);
  } catch (err) {
    console.error(err);
    res.status(500).send("An error occurred");
  }
});

module.exports = router;
