# encoding: UTF-8
class CreditCard

  TYPES = {
    :amex => /^3[47][0-9]{13}$/,
    :discover => /^6011[0-9]{12}$/,
    :mastercard => /^5[1-5][0-9]{14}$/,
    :visa => /^4[0-9]{12}(?:[0-9]{3})?$/
  }

  LENGTH_PER_TYPE = {
    :amex => 15,
    :discover => 16,
    :mastercard => 16,
    :visa => [13, 16]
  }

  def initialize(number)
    @number = strip(number).to_i
  end

  def number
    return @number
  end

  def type
    type = 'unknown'
    TYPES.keys.each do |t|
      type = t.to_s if @number.to_s =~ TYPES[t.to_sym]
    end

    return type
  end

  def check_size
    valid = false
    TYPES.keys.each do |t|
      case LENGTH_PER_TYPE[t.to_sym]
      when Fixnum
        valid = true if @number.size == LENGTH_PER_TYPE[t.to_sym] and @number.to_s =~ TYPES[t.to_sym]
      when Array
        valid = true if LENGTH_PER_TYPE[t.to_sym].include?(@number.size) and @number.to_s =~ TYPES[t.to_sym]
      end
    end

    return valid
  end

  private
  def strip(cc)
    cc.gsub(/\s/, '').strip
  end

end
