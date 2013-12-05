# encoding: UTF-8
require 'debugger'
class CreditCard

  TYPES = {
    :amex => { :length => 15, :regex => /^3[47][0-9]{13}$/ },
    :discover => { :length => 16, :regex => /^6011[0-9]{12}$/ },
    :mastercard => { :length => 16, :regex => /^5[1-5][0-9]{14}$/ },
    :visa => { :length => [13, 16], :regex => /^4[0-9]{12}(?:[0-9]{3})?$/ }
  }

  def initialize(number)
    @number = strip(number).to_s
  end

  def number
    @number
  end

  def type
    type = 'unknown'
    TYPES.keys.each do |t|
      type = t.to_s if @number =~ TYPES[t.to_sym][:regex]
    end

    type
  end

  def check_size
    valid = false
    TYPES.keys.each do |t|
      case TYPES[t.to_sym][:length]
      when Fixnum
        valid = true if @number.size == TYPES[t.to_sym][:length] and @number =~ TYPES[t.to_sym][:regex]
      when Array
        valid = true if TYPES[t.to_sym][:length].include?(@number.size) and @number =~ TYPES[t.to_sym][:regex]
      end
    end

    valid
  end

  def validate!
    return false if !check_size

    total = []
    @number.reverse.chars.each_slice(2).each do |od, ev|
      od = od.to_i
      ev = ev.to_i

      pt = (ev == 1 ? 2 : ev * 2)
      pt = pt.to_s[0].to_i + pt.to_s[1].to_i if pt > 9

      total.push(od)
      total.push(pt)
    end

    (total.inject(:+) % 10 == 0)
  end

  private
  def strip(cc)
    cc.gsub(/\s/, '').strip
  end

end
