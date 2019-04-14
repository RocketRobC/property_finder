var path = require('path'),
  StatsPlugin = require('stats-webpack-plugin');

var devServerPort = process.env.WEBPACK_DEV_SERVER_PORT,
  devServerHost = process.env.WEBPACK_DEV_SERVER_HOST,
  publicPath = process.env.WEBPACK_PUBLIC_PATH;

const MiniCssExtractPlugin = require('mini-css-extract-plugin');

var config = {
  entry: {
    application: './apps/web/assets/javascripts/application.js',
    styles: './apps/web/assets/stylesheets/styles.scss',
  },

  module: {
    rules: [
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              hmr: process.env.NODE_ENV === 'development',
            },
          },
          'css-loader',
          'sass-loader',
        ],
      },
    ],
  },

  output: {
    path: path.join(__dirname, 'public'),
    filename: '[name]-[chunkhash].js',
  },

  plugins: [
    new StatsPlugin('webpack_manifest.json'),
    new MiniCssExtractPlugin({
      // Options similar to the same options in webpackOptions.output
      // both options are optional
      filename: '[name].css',
      chunkFilename: '[id].css',
    }),
  ],
};

if (process.env.INBUILT_WEBPACK_DEV_SERVER) {
  config.devServer = {
    port: devServerPort,
    headers: { 'Access-Control-Allow-Origin': '*' },
  };
  config.output.publicPath = '//' + devServerHost + ':' + devServerPort + '/';
}

module.exports = config;
