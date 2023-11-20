const app = require("./app");
const db = require("./src/configs/db.config");
const UserModel = require("./src/models/user.model");
const AnimeModel = require("./src/models/anime.model");
const SerieModel = require("./src/models/serie.model");
const FilmModel = require("./src/models/film.model");
const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`App running on port http://localhost:${port} ...`);
});

// app.get("/", (req, res) => {
//   res.send("Hello from the server side!!");
// });

// app.get("/animes", (req, res) => {
//   res.send("Anime is cool!");
// });

// app.get("/series", (req, res) => {
//   res.send("Series is cool!");
// });

// app.get("/films", (req, res) => {
//   res.send("Films is cool!");
// });
