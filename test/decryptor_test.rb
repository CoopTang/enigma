require './test/test_helper'
require './lib/shift_manager'
require './lib/decryptor'

class DecryptorTest < Minitest::Test
  
  def setup
    @shifts = {
      A: 5,
      B: 18,
      C: 31,
      D: 35
    }
    @decryptor = Decryptor.new(@shifts)
  end

  def test_it_exists
    assert_instance_of Decryptor, @decryptor
  end

  def test_can_shift_a_letter
    assert_equal "a", @decryptor.shift_character("b", 1)
    assert_equal "z", @decryptor.shift_character(" ", 1)
    assert_equal "z", @decryptor.shift_character("a", 2)
    assert_equal " ", @decryptor.shift_character("a", 1)
    assert_equal "a", @decryptor.shift_character("a", 27)
    assert_equal "w", @decryptor.shift_character(" ", 31)
  end

  def test_only_shifts_needed_characters
    message = "mwptt,dbxwv"
    assert_equal "h", @decryptor.shift_char_at_index(message, 0)
    assert_equal ",", @decryptor.shift_char_at_index(message, 5)
  end

  def test_can_change_key_sets
    new_shifts = {
      A: 1,
      B: 2,
      C: 3,
      D: 4
    }
    @decryptor.change_shifts(new_shifts)
    assert_equal true, @shifts != @decryptor.shifts
  end

  def test_can_decrypt_message
    assert_equal "hello", @decryptor.decrypt("mwptt")
    assert_equal "hello world", @decryptor.decrypt("mwpttr wwch")
    assert_equal "hello, user", @decryptor.decrypt("mwptt,dbxwv")
  end

  def test_can_check_if_shifts_are_the_same
    new_shifts = {
      A: 1,
      B: 2,
      C: 3,
      D: 4
    }
    assert_equal true, @decryptor.same_shifts?(@shifts)
    assert_equal false, @decryptor.same_shifts?(new_shifts)
  end

end