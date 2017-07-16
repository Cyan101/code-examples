#[2017-04-24] Challenge #312 [Easy] L33tspeak Translator
#https://www.reddit.com/r/dailyprogrammer/comments/67dxts/20170424_challenge_312_easy_l33tspeak_translator/

Rules = {
  'A' => '4',
  'B' => '6',
  'E' => '3',
  'I' => '1',
  'L' => '1',
  'M' => '(V)',
  'N' => '(\)',
  'O' => '0',
  'S' => '5',
  'T' => '7',
  'V' => '\/',
  'W' => '`//',
}

def eng_to_l33t(input)
  input_array = input.upcase.split("")
  input_array.each do |char|
    begin
      print Rules.fetch(char)
    rescue
      print char
      next
    end
  end 
end

eng_to_l33t('hentai')