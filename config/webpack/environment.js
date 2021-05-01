const { environment } = require('@rails/webpacker')

// jQueryとBootstrapのJSを使えるように
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery'
  })
)

module.exports = environment
