require './test/test_helper'
require './lib/shift_manager'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  
  def setup
    @key  = "01234"
    @date = "250291"
    @shift_manager = ShiftManager.new(@key, @date)
    @encryptor     = Encryptor.new("Hello world", @shift_manager.shifts)
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_can_shift_a_letter
    assert_equal "b", @encryptor.shift_character("a", 1)
    assert_equal " ", @encryptor.shift_character("z", 1)
    assert_equal "a", @encryptor.shift_character("z", 2)
    assert_equal "a", @encryptor.shift_character(" ", 1)
    assert_equal "a", @encryptor.shift_character("a", 27)
  end

end