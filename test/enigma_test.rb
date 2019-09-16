require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_can_update_the_shift_with_key_and_date
    shift_manager = @enigma.instance_variable_get(:@shift_manager)
    initial_shifts = shift_manager.shifts
    expected_hash = {
      A: 5,
      B: 18,
      C: 31,
      D: 35
    }
    @enigma.update_shift_manager("01234", "250291")

    assert_equal expected_hash, @enigma.instance_variable_get(:@shift_manager).shifts
  end

  def test_it_can_update_encryptor_with_shifts
    shift_manager = @enigma.instance_variable_get(:@shift_manager)
    initial_shifts = shift_manager.shifts
    expected_shifts = {
      A: 5,
      B: 18,
      C: 31,
      D: 36
    }
    @enigma.update_encryptor_shifts(expected_shifts)
    assert_equal expected_shifts, @enigma.instance_variable_get(:@encryptor).shifts
  end

  def test_it_can_update_decryptor_with_shifts
    shift_manager = @enigma.instance_variable_get(:@shift_manager)
    initial_shifts = shift_manager.shifts
    expected_shifts = {
      A: 5,
      B: 18,
      C: 31,
      D: 36
    }
    @enigma.update_decryptor_shifts(expected_shifts)
    assert_equal expected_shifts, @enigma.instance_variable_get(:@decryptor).shifts
  end


  def test_can_encrypt_a_message_with_a_key_and_date
    expected_hash = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected_hash, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_can_decrypt_a_message_with_key_and_date
    expected_hash = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected_hash, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_can_encrypt_a_message_using_todays_date
    @enigma.instance_variable_get(:@shift_manager).expects(:date).returns("040895")
    shifts = { 
      A: 3,
      B: 27,
      C: 73,
      D: 20 
    }
    @enigma.instance_variable_get(:@shift_manager).expects(:shifts).returns(shifts)
    expected_hash = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected_hash, @enigma.encrypt("hello world", "02715")
  end

  def test_can_encrypt_a_message_with_only_message
    @enigma.instance_variable_get(:@shift_manager).expects(:key).returns("02715")
    @enigma.instance_variable_get(:@shift_manager).expects(:date).returns("040895")
    shifts = { 
      A: 3,
      B: 27,
      C: 73,
      D: 20 
    }
    @enigma.instance_variable_get(:@shift_manager).expects(:shifts).returns(shifts)

    expected_hash = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected_hash, @enigma.encrypt("hello world")
  end

  def test_can_decrypt_a_message_with_only_a_key
    @enigma.instance_variable_get(:@shift_manager).expects(:key).returns("02715")
    @enigma.instance_variable_get(:@shift_manager).expects(:date).returns("040895")
    shifts = { 
      A: 3,
      B: 27,
      C: 73,
      D: 20 
    }
    @enigma.instance_variable_get(:@shift_manager).expects(:shifts).returns(shifts)

    expected_hash = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected_hash, @enigma.decrypt("keder ohulw", "02715")
  end

end