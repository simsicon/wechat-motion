# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'

require 'bundler'
Bundler.require :default

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'wechat'
  app.vendor_project('vendor/wechat_sdk', :static)
  app.frameworks << 'CoreGraphics'
end
