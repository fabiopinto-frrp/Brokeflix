const app = require("./app");
const db = require("./configs/db.config");
const animesRoutes = require("./routes/animesRoutes");
const filmsRoutes = require("./routes/filmsRoutes");
const seriesRoutes = require("./routes/seriesRoutes");
const userRoutes = require("./routes/usersRoutes");

const port = process.env.PORT || 3000;

app.use("/api/animes", animesRoutes);
app.use("/api/films", filmsRoutes);
app.use("/api/series", seriesRoutes);
app.use("/api/users/", userRoutes);

app.listen(port, () => {
  console.log(`App running on port http://localhost:${port} ...`);
});
