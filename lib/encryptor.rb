require './lib/modules/character_set'

class Encryptor
  attr_reader :shifts

  include CharacterSet

  def initialize(shifts)
    @shifts         = shifts
    @num_shift_keys = @shifts.keys.length
  end

  def encrypt(message)
    shift_keys = @shifts.keys
    encrypted  = ""
    message.chars.each_index do |index|
      if CHAR_TO_NUM.has_key?(message[index])
        encrypted << shift_character(message[index], @shifts[shift_keys[index % @num_shift_keys]])
      else
        encrypted << message[index]
      end
    end
    encrypted
  end

  def change_shifts(shifts)
    @shifts         = shifts
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

end