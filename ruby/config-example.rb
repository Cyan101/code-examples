require 'yaml'

class Config
  def initialize(file)
    @config = YAML.load_file file
    @config.keys.each do |key|
      self.class.send(:define_method, key) do
        @config[key]
      end
    end
  end
end


config = Config.new('config.yaml')
puts config.secret_key

# Example config.yaml
#---
#  secret_key: OneTwoThreeFour
#  user_id: 123456789
