// webpack.dev.js

const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = merge(common, {
  entry: './srcjs/js/script.js',
  mode: "development",
  devtool: "inline-source-map",
  module: {
    rules: [
      // Process (s)css files
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
          {
            // Inject CSS into an HTML <Style> header
            loader: 'style-loader'
          },
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
          },
        ]
      },
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: 'development'
    })
  ]
});
