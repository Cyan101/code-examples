require 'yaml'
require 'ostruct'

def make_config(filename)
  loaded_yaml = YAML.load_file filename
  @config = OpenStruct.new(loaded_yaml)
end

make_config('config.yaml')
puts @config.id

# Example Config File
#---
#  id: 1234567890
#  secret: WubbaLubbaDubDub
