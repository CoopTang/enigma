require './lib/shift_manager'
require './lib/encryptor'
require './lib/decryptor'

class Enigma
  attr_reader

  def initialize
    @shift_manager = ShiftManager.new
    @encryptor     = Encryptor.new(@shift_manager.shifts)
    @decryptor     = Decryptor.new(@shift_manager.shifts)
  end

end