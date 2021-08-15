// webpack.common.js

const webpack = require('webpack');
const Path = require('path');
const TerserPlugin = require("terser-webpack-plugin");
const ESLintPlugin = require('eslint-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  entry: './srcjs/js/script.js',
  output: {
    path: Path.resolve(__dirname, "inst"),
    filename: "js/[name].js",
    chunkFilename: "js/[id].js"
  },
  module: {
    rules: [
      // Transpile .js files
      {
        test: /\.m?js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: [
              ['@babel/preset-env', { targets: "defaults" }]
            ]
          }
        }
      },
      // Process images
      {
        test: /\.(png|jpg|jpeg|gif)$/i,
        dependency: { not: ['url'] },
        type: 'asset/resource'
      },
      // Inline SVGs
      {
        test: /\.svg/,
        type: 'asset/inline',
        parser: {
          dataUrlCondition: {
            maxSize: 8 * 1024 // 8kb
          }
        }
      },
      // Process fonts
      {
        test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
        type: 'asset/resource'
      }
    ]
  },
  plugins: [
    // Extract CSS file from bundled JS file
    new MiniCssExtractPlugin({
      filename: "./css/[name].css",
      chunkFilename: "./css/[id].css"
    }),
    new ESLintPlugin(),
  ],
  resolve: {
    extensions: [".js", ".scss"],
    modules: ["node_modules"],
    alias: {
      request$: "xhr"
    }
  }
};
