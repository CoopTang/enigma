require './test/test_helper'
require './lib/key_manager'
require './lib/offset_manager'
require './lib/shift_manager'

class ShiftManagerTest < Minitest::Test
  
  def setup
    @key  = "01234"
    @date = "250291"
    @shift_manager = ShiftManager.new(@key, @date)
  end

  def test_it_exists
    assert_instance_of ShiftManager, @shift_manager
  end

  def test_can_generate_shifts
    expected_hash = {
      A: 5,
      B: 18,
      C: 31,
      D: 35
    }
    assert_equal expected_hash, @shift_manager.generate_shifts
  end

  def test_can_generate_new_shifts_after_new_key
  end

  def test_can_generate_new_shifts_after_new_offset
  end

end