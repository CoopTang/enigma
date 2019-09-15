require './test/test_helper'
require './lib/shift_manager'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  
  def setup
    @key  = "01234"
    @date = "250291"
    @shift_manager = ShiftManager.new(@key, @date)
    @encryptor = Encryptor.new("Hello world", @shift_manager.shifts)
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

end