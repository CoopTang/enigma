require './test/test_helper'
require './lib/offset_manager'

class OffsetManagerTest < Minitest::Test

  def setup
    @offset_manager = OffsetManager.new
  end

  def test_it_exists
    assert_instance_of OffsetManager, @offset_manager
  end

end