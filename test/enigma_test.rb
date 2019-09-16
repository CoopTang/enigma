require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
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

end