require './lib/modules/shiftable'

class Encryptor
  attr_reader :shifts

  include Shiftable

  def initialize(shifts)
    @shifts = shifts
  end

  def encrypt(message)
    encrypted  = ""
    message.chars.each_index do |index|
      encrypted << shift_char_at_index(message, index, ENCRYPT)
    end
    encrypted
  end

  def change_shifts(shifts)
    @shifts = shifts
  end

  def same_shifts?(shifts)
    @shifts == shifts
  end

end