require 'minitest/spec'
require 'minitest/autorun'
require './model/credit_card.rb'

describe CreditCard do
  describe 'VISA' do
    it 'should be a visa one' do
      cc1 = CreditCard.new('4111111111111111')
      cc2 = CreditCard.new('4111111111111')
      cc3 = CreditCard.new('4012888888881881')

      cc1.type.to_s.downcase.must_equal 'visa'
      cc2.type.to_s.downcase.must_equal 'visa'
      cc3.type.to_s.downcase.must_equal 'visa'

      cc1.validate!.must_equal true
      cc2.validate!.must_equal false
      cc3.validate!.must_equal true
    end
  end

  describe 'MasterCard' do
    it 'should be a mastercard one' do
      cc1 = CreditCard.new('5105105105105100')

      cc1.type.to_s.downcase.must_equal 'mastercard'

      cc1.validate!.must_equal true
    end

    it 'should be a mastercard one' do
      cc1 = CreditCard.new('5105 1051 0510 5106')
      cc1.type.to_s.downcase.must_equal 'mastercard'
      cc1.validate!.must_equal false
    end
  end

  describe 'AMEX' do
    it 'should be an amex one' do
      cc1 = CreditCard.new('378282246310005')

      cc1.type.to_s.downcase.must_equal 'amex'

      cc1.validate!.must_equal true
    end
  end

  describe 'Discover' do
    it 'should be a discover one' do
      cc1 = CreditCard.new('6011111111111117')

      cc1.type.to_s.downcase.must_equal 'discover'

      cc1.validate!.must_equal true
    end
  end
end
