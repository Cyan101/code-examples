require 'yaml'

yaml = YAML.load_file('list.yml')

puts yaml['treat'].sample unless ARGV[0]
puts yaml[ARGV[0]].sample if ARGV[0]