const path = require("path");

module.exports = {
  target: "node",
  entry: {
    app: "./src/main.js",
  },
  module: {
    rules: [],
  },
  output: {
    filename: "[name].bundle.js",
    path: path.resolve(__dirname, "dist"),
    publicPath: "/",
  },
};
