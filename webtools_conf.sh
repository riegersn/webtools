#!/bin/bash
# Webtools Configuration

# project base directory
project=$(pwd)

# base where you want your library file to go
base=lib


# npm package folder
components=node_modules

# library folders by type
js_dir=$base/js
css_dir=$base/css
font_dir=$base/fonts

# your project files.
# (assumes pwd is $project/$components dir)
filelist=(
	'jquery/dist/jquery.min.js'
	'bootstrap/dist/css/bootstrap.min.css'
	'bootstrap/dist/js/bootstrap.min.js'
	'bootstrap/dist/fonts/*'
	'masonry-layout/dist/masonry.pkgd.min.js'
)
