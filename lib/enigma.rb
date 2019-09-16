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

  def encrypt(message, key = nil, date = nil)
    @shift_manager.generate_key(key)     unless @shift_manager.same_key?(key)
    @shift_manager.generate_offset(date) unless @shift_manager.same_date?(date)

    shifts = @shift_manager.shifts
    @encryptor.change_shifts(shifts) unless @encryptor.same_shifts?(shifts)
    {
      encryption: @encryptor.encrypt(message),
      key: @shift_manager.key,
      date: @shift_manager.date
    }
  end

  def decrypt(message, key, date = nil)
    @shift_manager.generate_key(key)     unless @shift_manager.same_key?(key)
    @shift_manager.generate_offset(date) unless @shift_manager.same_date?(date)

    shifts = @shift_manager.shifts
    @decryptor.change_shifts(shifts) unless @decryptor.same_shifts?(shifts)
    {
      decryption: @decryptor.decrypt(message),
      key: @shift_manager.key,
      date: @shift_manager.date
    }
  end



end