require 'date'

class OffsetManager
  attr_reader :date, 
              :offset, 
              :shifts

  def initialize(date = nil)
    generate_offset(date)
  end

  def generate_offset(date = nil)
    @date   = date ? date : generate_date_string
    @offset = generate_offset_string
    @shifts = generate_shifts
  end

  def generate_offset_string
    square_date_string(@date)[-4..-1]
  end

  def generate_shifts
    {
      A: @offset[0].to_i,
      B: @offset[1].to_i,
      C: @offset[2].to_i,
      D: @offset[3].to_i
    }
  end

  def generate_date_string
    format_date_for_offset(current_date)
  end

  def current_date
    Date.today
  end

  def format_date_for_offset(date)
    date.strftime("%d%m%y")
  end

  def square_date_string(date_string)
    (date_string.to_i ** 2).to_s
  end

end