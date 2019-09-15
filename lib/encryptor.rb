require './lib/modules/character_set'

class Encryptor
  attr_reader 

  include CharacterSet

  def initialize(message, shifts)
    @message  = message
    @shifts   = shifts
  end

  def shift_character(character, number)
    char_key     = CHAR_TO_NUM[character] + number
    is_divisible = char_key == 27 ? 27 : 0
    NUM_TO_CHAR[char_key % 27 + is_divisible]
  end

end