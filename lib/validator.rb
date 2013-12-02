# encoding: UTF-8
class Validator

  def initialize(credit_card)
    @cc = credit_card
  end

  def validate!
    return false if !@cc.check_size

    total = []
    strip(@cc.number).reverse.chars.each_slice(2).each do |od, ev|
      od = od.to_i
      ev = ev.to_i

      pt = (ev == 1 ? 2 : ev * 2)
      pt = pt.to_s[0].to_i + pt.to_s[1].to_i if pt > 9

      total.push(od)
      total.push(pt)
    end

    return (total.inject(:+) % 10 == 0)
  end

  private
  def strip(cc)
    cc.to_s.gsub(/\s/, '').strip
  end

end
