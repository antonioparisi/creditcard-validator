# encoding: UTF-8
class CreditCard

  TYPES = {
    :amex => { :length => 15, :regex => /^3[47][0-9]{13}$/ },
    :discover => { :length => 16, :regex => /^6011[0-9]{12}$/ },
    :mastercard => { :length => 16, :regex => /^5[1-5][0-9]{14}$/ },
    :visa => { :length => [13, 16], :regex => /^4[0-9]{12}(?:[0-9]{3})?$/ }
  }

  def initialize(number)
    @number = strip(number).to_i
  end

  def number
    @number
  end

  def type
    type = 'unknown'
    TYPES.keys.each do |t|
      type = t.to_s if @number.to_s =~ TYPES[t.to_sym][:regex]
    end

    type
  end

  def check_size
    valid = false
    TYPES.keys.each do |t|
      case TYPES[t.to_sym][:length]
      when Fixnum
        valid = true if @number.to_s.size == TYPES[t.to_sym][:length] and @number.to_s =~ TYPES[t.to_sym][:regex]
      when Array
        valid = true if TYPES[t.to_sym][:length].include?(@number.to_s.size) and @number.to_s =~ TYPES[t.to_sym][:regex]
      end
    end

    valid
  end

  private
  def strip(cc)
    cc.gsub(/\s/, '').strip
  end

end
