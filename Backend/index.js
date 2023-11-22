const app = require("./app");
const db = require("./src/configs/db.config");
const animesRoutes = require("./src/routes/animesRoutes");
// const seriesRoutes = require("./src/controllers/seriesRoutes");
// const filmsRoutes = require("./src/controllers/filmRoutes");
const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`App running on port http://localhost:${port} ...`);
});

app.use("/api/animes", animesRoutes);
// app.use("/api/series", seriesRoutes);
// app.use("/api/films", filmsRoutes);

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
