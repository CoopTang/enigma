require './test/test_helper'
require './lib/shift_manager'
require './lib/encryptor'

class EncryptorTest < Minitest::Test
  
  def setup
    @shifts = {
      A: 5,
      B: 18,
      C: 31,
      D: 35
    }
    @encryptor = Encryptor.new(@shifts)
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
    assert_equal " ", @encryptor.shift_character("w", 31)
  end

  def test_can_encrypt_message
    assert_equal "mwptt", @encryptor.encrypt("hello")
    assert_equal "mwpttr wwch", @encryptor.encrypt("hello world")
    assert_equal "mwptt,dbxwv", @encryptor.encrypt("hello, user")
  end

end