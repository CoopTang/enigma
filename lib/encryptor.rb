require './lib/modules/character_set'

class Encryptor
  attr_reader :shifts

  include CharacterSet

  def initialize(shifts)
    @shifts         = shifts
    @shift_keys     = @shifts.keys
    @num_shift_keys = @shifts.keys.length
  end

  def encrypt(message)
    encrypted  = ""
    message.chars.each_index do |index|
      encrypted << shift_char_at_index(message, index)
    end
    encrypted
  end

  def change_shifts(shifts)
    @shifts         = shifts
    @shift_keys     = @shifts.keys
    @num_shift_keys = @shifts.keys.length
  end

  def shift_character(character, number)
    num_char_set = CHAR_TO_NUM.keys.length
    char_key     = CHAR_TO_NUM[character] + number
    is_divisible = char_key % num_char_set == 0 ? num_char_set : 0
    NUM_TO_CHAR[char_key % num_char_set + is_divisible]
  end

  def same_shifts?(shifts)
    @shifts == shifts
  end

  def shift_char_at_index(message, index)
    if CHAR_TO_NUM.has_key?(message[index])
      shift_key = @shift_keys[index % @num_shift_keys]
      shift_character(message[index], @shifts[shift_key])
    else
      message[index]
    end
  end

end