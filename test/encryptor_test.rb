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

  def test_can_change_key_sets
    new_shifts = {
      A: 1,
      B: 2,
      C: 3,
      D: 4
    }
    @encryptor.change_shifts(new_shifts)
    assert_equal true, @shifts != @encryptor.shifts
  end

  def test_only_shifts_needed_characters
    message = "hello, user"
    assert_equal "m", @encryptor.shift_char_at_index(message, 0)
    assert_equal ",", @encryptor.shift_char_at_index(message, 5)
  end

  def test_can_encrypt_message
    assert_equal "mwptt", @encryptor.encrypt("hello")
    assert_equal "mwpttr wwch", @encryptor.encrypt("hello world")
    assert_equal "mwptt,dbxwv", @encryptor.encrypt("hello, user")
  end

  def test_can_check_if_shifts_are_the_same
    new_shifts = {
      A: 1,
      B: 2,
      C: 3,
      D: 4
    }
    assert_equal true, @encryptor.same_shifts?(@shifts)
    assert_equal false, @encryptor.same_shifts?(new_shifts)
  end

end