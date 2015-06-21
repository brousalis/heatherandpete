require 'slim'

# dumb :locals warn, thanks slim
Slim::Engine.disable_option_validator!

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Turn on autoprefixer
activate :autoprefixer  do |config|
  config.browsers = ['last 3 versions', 'Explorer >= 9']
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'app'
set :images_dir, 'images'

activate :directory_indexes

sprockets.append_path File.join root, 'bower_components'
sprockets.append_path File.join root, "source", "common"

ignore '.idea/*'
ignore 'test/**'

# Reload the browser automatically whenever files change
activate :livereload, apply_js_live: false, apply_css_live: false

# Development-specific configuration
configure :development do
  activate :dotenv
end

# Build-specific configuration
configure :build do
  activate :dotenv, env: '.env.production'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify HTML on build
  activate :minify_html

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash
  # Optmize images
  activate :imageoptim

  # GZip all the things
  activate :gzip
  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
