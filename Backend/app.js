const express = require("express");
const app = express();
require("dotenv/config");
const jwt = require("jsonwebtoken");
const bodyParser = require("body-parser");
const cors = require("cors");
const firebaseAdmin = require("firebase-admin");

// const serviceAccount = require(`${process.env.FIREBASE_SERVICE_ACCOUNT}`);

// admin.initializeApp({
//   credential: admin.credential.cert(serviceAccount),
// });

app.use(cors());
app.use(bodyParser.json());

module.exports = app;
