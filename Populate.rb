require './Names'

def populateNames()
  filename = "names-data.txt"
  contents = open(filename, 'r') { |f| f.read }
  contents = contents.split("\n").map{|x| x.split.each{|x| x.replace '1001' if x == '0'}}
  contents.map{|x|
    if !Name.first(:name => x[0])
      Name.create(
        name: x[0],
        decade1900: x[1].to_i,
        decade1910: x[2].to_i,
        decade1920: x[3].to_i,
        decade1930: x[4].to_i,
        decade1940: x[5].to_i,
        decade1950: x[6].to_i,
        decade1960: x[7].to_i,
        decade1970: x[8].to_i,
        decade1980: x[9].to_i,
        decade1990: x[10].to_i,
        decade2000: x[11].to_i
      )
    end
  }
end