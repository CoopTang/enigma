require './lib/key_manager'
require './lib/offset_manager'

class ShiftManager
  attr_reader :shifts

  def initialize(key = nil, date = nil)
    @key_manager    = KeyManager.new(key)
    @offset_manager = OffsetManager.new(date)
    @shifts         = generate_shifts
  end

  def generate_shifts
    @key_manager.key_shifts.merge(@offset_manager.)
  end

end