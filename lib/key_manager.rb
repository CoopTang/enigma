class KeyManager
  attr_reader :key,
              :key_shifts

  def initialize(key = nil)
    @key        = key ? key : generate_key_string
    @key_shifts = generate_key_shifts
  end

  def generate_new_key
    @key  = generate_key_string
    @key_shifts = generate_key_shifts
  end

  def generate_key_string
    number_string = generate_random_number.to_s
    pad_with_zeroes(number_string)
  end

  def generate_key_shifts
    {
      A: @key[0..1].to_i,
      B: @key[1..2].to_i,
      C: @key[2..3].to_i,
      D: @key[3..4].to_i
    }
  end

  def generate_random_number
    rand(99999)
  end

  def pad_with_zeroes(number_string)
    number_string.rjust(5, "0")
  end
    
end