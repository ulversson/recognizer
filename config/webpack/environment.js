const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.loaders.insert('sass', {
    test: /\.scss|\.sass$/,
    use: [
      "to-string-loader", 
      "css-loader", 
      "sass-loader" 
    ]
});
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: ['popper.js', 'default']
  })
)
module.exports = environment
