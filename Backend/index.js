const app = require("./app");
const db = require("./src/configs/db.config");
const animesRoutes = require("./src/routes/animesRoutes");
const filmsRoutes = require("./src/routes/filmsRoutes");
const seriesRoutes = require("./src/routes/seriesRoutes");
const userRoutes = require("./src/routes/usersRoutes");

const port = process.env.PORT || 3000;
app.get("/api/docs", (req, res) => {
  res.status(200).send("GREETINGS !");
});

app.use("/api/animes", animesRoutes);
app.use("/api/films", filmsRoutes);
app.use("/api/series", seriesRoutes);
app.use("/api/users/", userRoutes);

app.listen(port, () => {
  console.log(`App running on port http://localhost:${port} ...`);
});
