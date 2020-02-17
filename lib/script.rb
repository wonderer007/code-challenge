require 'rubygems'
require 'bundler'
require_relative 'google_search_results.rb'
require 'pry'

gemfile_dir = File.expand_path(File.join(File.dirname(__FILE__), '..'))
gemfile = File.join(gemfile_dir, 'Gemfile')

Dir.chdir(gemfile_dir)

system "bundle install --gemfile #{gemfile}"

query = ARGV[0]

if query
  result = GoogleSearchResults.new(query: query).result
  File.open("files/output/#{query.downcase.split(' ').join('-')}.json","w") do |f|    
    f.write(result.to_json)
  end
end