const options = {
  swaggerDefinition: {
    info: {
      description: "Brokeflix API for Authorized Users",
      title: "Brokeflix API",
      version: "1.0.0",
    },
    host: "localhost:8080",
    basePath: "/",
    produces: ["application/json"],
    schemes: ["http"],
    securityDefinitions: {
      Bearer: {
        type: "apiKey",
        in: "header",
        name: "Authorization",
        description: "Bearer Token",
      },
    },
  },
  basedir: __dirname,

  files: ["../routes/**/*.js", "../models/**/*.js"],
};

module.exports = options;
