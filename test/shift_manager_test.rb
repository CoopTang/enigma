require './test/test_helper'
require './lib/key_manager'
require './lib/offset_manager'
require './lib/shift_manager'

class ShiftManagerTest < Minitest::Test
  
  def setup
    @key  = "01234"
    @date = "250291"
    @initial_shifts = {
      A: 5,
      B: 18,
      C: 31,
      D: 35
    }
    @shift_manager = ShiftManager.new(@key, @date)
  end

  def test_it_exists
    assert_instance_of ShiftManager, @shift_manager
  end

  def test_can_generate_shifts
    @shift_manager.generate_shifts
    assert_equal @initial_shifts, @shift_manager.shifts
  end

  def test_can_generate_new_shifts_after_new_key
    new_shifts = {
      A: 5,
      B: 18,
      C: 31,
      D: 36
    }
    @shift_manager.generate_key("01235")

    assert_equal new_shifts, @shift_manager.shifts
  end

  def test_can_generate_new_shifts_after_new_offset
    new_shifts = {
      A: 5,
      B: 16,
      C: 23,
      D: 34
    }
    @shift_manager.generate_offset("010120")
    
    assert_equal new_shifts, @shift_manager.shifts
  end

  def test_can_check_if_the_same_key
    assert_equal true, @shift_manager.same_key?("01234")
    assert_equal false, @shift_manager.same_key?("01235")
  end

  def test_can_check_if_the_same_date
    assert_equal true, @shift_manager.same_date?("250291")
    assert_equal false, @shift_manager.same_date?("010120")
  end

  def test_can_get_the_key_used
    assert_equal @key, @shift_manager.key
  end

  def test_can_get_the_date_used
    assert_equal @date, @shift_manager.date
  end

end