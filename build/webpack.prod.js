// webpack.prod.js

const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const TerserPlugin = require("terser-webpack-plugin");
const CssMinimizerPlugin = require("css-minimizer-webpack-plugin");

module.exports = merge(common, {
  entry: {
    "radminkit": './srcjs/js/script.js',
    "radminkit.min": './srcjs/js/script.js'
  },
  // mode should be 'production', but webpack is automatically
  // minifying all css files - even when the optimization settings
  // is disabled
  mode: "development",
  devtool: "source-map",
  module: {
    rules: [
      // Process (s)css files
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
          // Extract CSS from created JS file
          MiniCssExtractPlugin.loader,
          {
            // translates CSS into CommonJS modules
            loader: 'css-loader'
          },
          {
            // Run postcss operations
            loader: 'postcss-loader',
            options: {
              postcssOptions: {
                plugins: function () {
                  return [
                    require('autoprefixer')
                  ];
                }
              }
            }
          },
          {
            // Compile Sass file(s) to CSS
            loader: 'sass-loader',
            options: {
              // use dart-sass
              implementation: require.resolve("sass")
            }
          }
        ]
      },
    ]
  },
  optimization: {
    minimize: true,
    minimizer: [
      new TerserPlugin({
        test: /\.min\.js$/,
        parallel: true
      }),
      new CssMinimizerPlugin({
        test: /\.min\.css$/,
        minimizerOptions: {
          preset: [
            "default",
            {
              discardComments: {
                removeAll: true
              }
            }
          ]
        },
        parallel: true
      })
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: 'Production'
    })
  ]
});
