const { environment } = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery/src/jquery',
  })
);

environment.toWebpackConfig().merge({
  resolve: {
    alias: {
      jquery: 'jquery/src/jquery',
    },
  },
});

module.exports = environment;
