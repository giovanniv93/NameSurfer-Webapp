require 'sinatra'
require './Names'

get '/' do
  erb :home
end