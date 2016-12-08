require 'sinatra'
require './Populate'
require 'json'

get '/' do
  erb :graph
end

get '/name' do
  if params['text'].match(/^[a-zA-Z]+$/)
    erb :name_not_found
  end
  name = params['text'].srip
  if Name.first(:name => name)
    content_type :json
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
  else
    erb :name_not_found
  end
end