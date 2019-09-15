require './lib/modules/character_set'

class Encryptor
  attr_reader 

  include CharacterSet

  def initialize(shifts)
    @shifts = shifts
  end

  def shift_character(character, number)
    char_key     = CHAR_TO_NUM[character] + number
    is_divisible = char_key % 27 == 0 ? 27 : 0
    NUM_TO_CHAR[char_key % 27 + is_divisible]
  end

  def encrypt(message)
    shift_keys = @shifts.keys
    encrypted = ""
    message.chars.each_index do |index|
      if CHAR_TO_NUM.has_key?(message[index])
        encrypted << shift_character(message[index], @shifts[shift_keys[index % 4]])
      else
        encrypted << message[index]
      end
    end
    encrypted
  end

end