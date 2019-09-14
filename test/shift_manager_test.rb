require './test/test_helper'
require './lib/key_manager'
require './lib/offset_manager'
require './lib/shift_manager'

class ShiftManagerTest < Minitest::Test
  
  def setup
    @shift_manager = ShiftManager.new
  end

  def test_it_exists
    assert_instance_of ShiftManager, @shift_manager
  end

end