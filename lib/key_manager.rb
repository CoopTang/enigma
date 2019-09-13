class KeyManager
  attr_reader :key,
              :keys

  def initialize(key = nil)
    @key = key ? key : generate_key
    @keys = generate_key_shift
  end

  def generate_key
    # generate_number
    # if number.length < 5
      # pad number
    # 
  end

  def genereate_key_shift
  end

  def generate_random_number
    rand(99999)
  end

  def pad_with_zeroes(number_string)
    number_string.rjust(5, "0")
  end
    
end