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
    @key_manager.shifts.merge(@offset_manager.shifts) do |letter, key, offset|
      key + offset
    end
  end

  def generate_key(key = nil)
    @key_manager.generate_key(key)
    @shifts = generate_shifts
  end

  def generate_offset(date = nil)
    @offset_manager.generate_offset(date)
    @shifts = generate_shifts
  end

  def same_key?(key)
    @key_manager.key == key
  end

  def same_date?(date)
    @offset_manager.date == date
  end

  def key
    @key_manager.key
  end

  def date
    @offset_manager.date
  end
end