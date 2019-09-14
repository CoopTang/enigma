require './test/test_helper'
require './lib/key_manager'

class KeyManagerTest < Minitest::Test

  def setup
    @key_manager = KeyManager.new
  end

  def test_it_exists
    assert_instance_of KeyManager, @key_manager
  end

  def test_can_generate_a_random_number
    number = @key_manager.generate_random_number
    is_within_range = number >= 0 && number <= 99999
    
    assert_equal true, is_within_range
  end

  def test_can_pad_number_with_leading_zeroes
    generated_number_1 = "23"
    generated_number_2 = "51234"

    assert_equal "00023", @key_manager.pad_with_zeroes(generated_number_1)
    assert_equal "51234", @key_manager.pad_with_zeroes(generated_number_2)
  end

  def test_can_generate_a_key_string
    @key_manager.stubs(:generate_random_number).returns(23)
    
    assert_equal "00023", @key_manager.generate_key_string
  end

  def test_can_generate_key_shift
    @key_manager = KeyManager.new("01234")
    expected_hash = {
      A: 01,
      B: 12,
      C: 23,
      D: 34
    }
    assert_equal expected_hash, @key_manager.generate_key_shifts
  end

  def test_can_generate_new_keys
    original_key = @key_manager.key
    original_keys = @key_manager.key_shifts
    @key_manager.generate_new_key
    assert_equal true, original_key != @key_manager.key
    assert_equal true,  original_keys != @key_manager.key_shifts
  end

end