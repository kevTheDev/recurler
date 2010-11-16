require 'test/unit'
require 'rubygems'
require "bundler"
Bundler.setup

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"
require 'recurler'
require 'shoulda'