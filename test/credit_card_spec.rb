require 'minitest/spec'
require 'minitest/autorun'
require './lib/credit_card.rb'

describe CreditCard do
  describe 'VISA' do
    it 'should be a visa one' do
      CreditCard.new('4111111111111111').type.to_s.downcase.must_equal 'visa'
      CreditCard.new('4111111111111').type.to_s.downcase.must_equal 'visa'
      CreditCard.new('4012888888881881').type.to_s.downcase.must_equal 'visa'
    end
  end

  describe 'MasterCard' do
    it 'should be a mastercard one' do
      CreditCard.new('5105105105105100').type.to_s.downcase.must_equal 'mastercard'
    end

    it 'should be a mastercard one' do
      CreditCard.new('5105 1051 0510 5106').type.to_s.downcase.must_equal 'mastercard'
    end
  end

  describe 'AMEX' do
    it 'should be an amex one' do
      CreditCard.new('378282246310005').type.to_s.downcase.must_equal 'amex'
    end
  end

  describe 'Discover' do
    it 'should be a discover one' do
      CreditCard.new('6011111111111117').type.to_s.downcase.must_equal 'discover'
    end
  end
end
