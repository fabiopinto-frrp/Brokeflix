require("dotenv/config");
const express = require("express");
const app = express();
const jwt = require("jsonwebtoken");
const bodyParser = require("body-parser");
const cors = require("cors");
const firebaseAdmin = require("firebase-admin");

app.use(cors());
app.use(bodyParser.json());

module.exports = app;
