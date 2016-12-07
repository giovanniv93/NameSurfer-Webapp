require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default , "sqlite3://#{Dir.pwd}/Users.db")

class Name
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :decade1900, Integer
  property :decade1910, Integer
  property :decade1920, Integer
  property :decade1930, Integer
  property :decade1940, Integer
  property :decade1950, Integer
  property :decade1960, Integer
  property :decade1970, Integer
  property :decade1980, Integer
  property :decade1990, Integer
  property :decade2000, Integer
end

DataMapper.finalize()