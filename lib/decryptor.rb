require './lib/modules/character_set'

class Decryptor
  attr_reader :shifts

  include CharacterSet

  def initialize(shifts)
    @shifts         = shifts
    @shift_keys     = @shifts.keys
    @num_shift_keys = @shifts.keys.length
  end

  def decrypt(message)
    decrypted  = ""
    message.chars.each_index do |index|
      decrypted << shift_char_at_index(message, index)
    end
    decrypted
  end

  def change_shifts(shifts)
    @shifts         = shifts
    @shift_keys     = @shifts.keys
    @num_shift_keys = @shifts.keys.length
  end

  def shift_character(character, number)
    num_char_set = CHAR_TO_NUM.keys.length
    char_key     = CHAR_TO_NUM[character] - number
    is_divisible = char_key % num_char_set == 0 ? num_char_set : 0
    NUM_TO_CHAR[char_key % num_char_set + is_divisible]
  end

  def same_shifts?(shifts)
    @shifts == shifts
  end

  def shift_char_at_index(message, index)
    if CHAR_TO_NUM.has_key?(message[index])
      shift_character(message[index], @shifts[@shift_keys[index % @num_shift_keys]])
    else
      message[index]
    end
  end

end