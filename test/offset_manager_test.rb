require './test/test_helper'
require './lib/offset_manager'

class OffsetManagerTest < Minitest::Test

  def setup
    @offset_manager = OffsetManager.new("010120")
  end

  def test_it_exists
    assert_instance_of OffsetManager, @offset_manager
  end

  def test_can_get_current_date
    date = Date.today
    assert_equal date, @offset_manager.current_date
  end

  def test_can_get_date_in_mm_dd_yy_format
    date_string = "250291"
    date = Date.new(1991, 02, 25)

    assert_equal date_string, @offset_manager.format_date_for_offset(date)
  end

  def test_can_generate_date_string
    @offset_manager.stubs(:current_date).returns(Date.new(1991, 02, 25))

    assert_equal "250291", @offset_manager.generate_date_string
  end

  def test_can_square_date_string
    assert_equal "62645584681", @offset_manager.square_date_string("250291")
  end
  
  def test_can_generate_offset_string
    offset_manager = OffsetManager.new("250291")
    assert_equal "4681", offset_manager.generate_offset_string
  end

  def test_can_generate_shift
    offset_manager = OffsetManager.new("250291")
    expected_hash = {
      A: 4,
      B: 6,
      C: 8,
      D: 1
    }

    assert_equal expected_hash, offset_manager.generate_shifts
  end

  def test_can_generate_new_offset
    date    = @offset_manager.date
    offset  = @offset_manager.offset
    offsets = @offset_manager.shifts

    @offset_manager.generate_new_offset

    assert_equal true, date != @offset_manager.date
    assert_equal true, offset != @offset_manager.offset
    assert_equal true, offsets != @offset_manager.shifts
  end
    
end