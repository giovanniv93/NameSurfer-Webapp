require 'sinatra'
require './Populate'
require 'json'

get '/' do
  erb :graph
end

get '/name' do

  name = params['text'].strip
  if name.match(/^[a-zA-Z]+$/)
    name = name.capitalize
    if Name.first(:name => name)
      content_type :json
      if
        Name.first(:name => name).decade1900 < 1 || Name.first(:name => name).decade1900 > 1001 ||
        Name.first(:name => name).decade1910 < 1 || Name.first(:name => name).decade1910 > 1001 ||
        Name.first(:name => name).decade1920 < 1 || Name.first(:name => name).decade1920 > 1001 ||
        Name.first(:name => name).decade1930 < 1 || Name.first(:name => name).decade1930 > 1001 ||
        Name.first(:name => name).decade1940 < 1 || Name.first(:name => name).decade1940 > 1001 ||
        Name.first(:name => name).decade1950 < 1 || Name.first(:name => name).decade1950 > 1001 ||
        Name.first(:name => name).decade1960 < 1 || Name.first(:name => name).decade1960 > 1001 ||
        Name.first(:name => name).decade1970 < 1 || Name.first(:name => name).decade1970 > 1001 ||
        Name.first(:name => name).decade1980 < 1 || Name.first(:name => name).decade1980 > 1001 ||
        Name.first(:name => name).decade1990 < 1 || Name.first(:name => name).decade1990 > 1001 ||
        Name.first(:name => name).decade2000 < 1 || Name.first(:name => name).decade2000 > 1001
        content_type :json
        { :result => 'Invalid Data From Database' }.to_json
      else
        arr = [
            Name.first(:name => name).name,
            Name.first(:name => name).decade1900.to_s,
            Name.first(:name => name).decade1910.to_s,
            Name.first(:name => name).decade1920.to_s,
            Name.first(:name => name).decade1930.to_s,
            Name.first(:name => name).decade1940.to_s,
            Name.first(:name => name).decade1950.to_s,
            Name.first(:name => name).decade1960.to_s,
            Name.first(:name => name).decade1970.to_s,
            Name.first(:name => name).decade1980.to_s,
            Name.first(:name => name).decade1990.to_s,
            Name.first(:name => name).decade2000.to_s,
        ]
        { :result => arr }.to_json
      end
    else
      content_type :json
      { :result => 'Name Not Found' }.to_json
    end
  else
    content_type :json
    { :result => 'Invalid Characters' }.to_json
  end
end

not_found do
  erb :page_not_found
end