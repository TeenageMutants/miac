# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js
Rails.application.config.assets.precompile = ['*.svg', '*.js', '*.css','*.png' ,'*.gif', '*.eot', '*.woff2','*.woff','*.ttf', '*.jpg', '*.png' ]
Rails.application.config.assets.precompile << /(^[^_\/]|\/[^_])[^\/]*$/
Rails.application.config.assets.precompile += ["*.js", "*.css", "jquery-migrate-rails.js"]
Rails.application.config.assets.precompile += %w( bootstrap/* )
Rails.application.config.assets.precompile += %w( * )
Rails.application.config.assets.precompile += %w( *.css.sass )
Rails.application.config.assets.precompile += %w( *.css.scss )
Rails.application.config.assets.precompile += %w( *.css )
Rails.application.config.assets.precompile += %w( *.js )
Rails.application.config.assets.precompile += %w( *.js.coffee )
Rails.application.config.assets.precompile += %w( *.js.coffee.erb )

Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.ico)
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'bootstrap-sass-3.3.6','bootstrap-sass-official', 'assets', 'fonts')
Rails.application.config.assets.precompile << %r(.*.(?:eot|svg|ttf|woff)$)
Rails.application.config.assets.precompile = ['*.js', '*.css', '*.css.erb']