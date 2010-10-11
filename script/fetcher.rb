#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../config/environment.rb'

config = YAML.load_file "#{Rails.root}/config/mail.yml"
config = config[Rails.env].to_options
fetcher = Fetcher.create({:receiver=>StoryProcessor}.merge(config))

# To run as a daemon
# loop do
#   fetcher.fetch
#   sleep 60
# end

fetcher.fetch