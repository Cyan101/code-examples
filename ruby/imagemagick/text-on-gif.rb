require 'rmagick'
require 'open-uri'
include Magick

giflist = Magick::ImageList.new('pewpewpew.gif')

newgif = Draw.new  {
    self.font_family = 'arial.ttf'
    self.fill = 'black'
    self.stroke = 'transparent'
    self.pointsize = 32
    self.font_weight = BoldWeight
    self.gravity = NorthGravity
}
open('avatar.jpg', 'wb') do |file|
  file << open('https://cdn.discordapp.com/avatars/141545699442425856/b306c9a4db4717f4d6ad77a50d01c9e1.jpg').read
end
avatar = Magick::Image.read('avatar.jpg').first

giflist.each { |image| image.composite!(avatar, NorthWestGravity, 1, 86, OverCompositeOp) }
word = 'RIP'
giflist.each { |image| newgif.annotate(image, 20, 20, 270, 260, word) } #img, width, height, x, y, text
giflist.write('newgif.gif')
