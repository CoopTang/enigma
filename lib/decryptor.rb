require './lib/modules/shiftable'

class Decryptor
  attr_reader :shifts

  include Shiftable

  def initialize(shifts)
    @shifts = shifts
  end

  def decrypt(message)
    decrypted  = ""
    message.chars.each_index do |index|
      decrypted << shift_char_at_index(message, index, DECRYPT)
    end
    decrypted
  end

  def change_shifts(shifts)
    @shifts = shifts
  end

  def same_shifts?(shifts)
    @shifts == shifts
  end

end