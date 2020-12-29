require 'dotenv/load'
require 'nokogiri'
require 'open-uri'

require_relative "./stock_info_cli/version"
require_relative "./stock_info_cli/cli"
require_relative "./stock_info_cli/api"
require_relative "./stock_info_cli/stock"

#require_all 'stock_info_cli'
#adds all the files in the folder so you dont need to install each one individualy 

require 'bundler'
Bundler.require

# puts "in environment"



