require 'json'

hash = { thing: "meme" }

File.open('memes.json') { |f| f.write(hash.to_json)
