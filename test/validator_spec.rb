require 'minitest/spec'
require 'minitest/autorun'
require './lib/validator.rb'
require './lib/credit_card.rb'

describe Validator do
  describe 'VISA' do
    it 'should be valid' do
      cc = CreditCard.new('4111111111111111')
      Validator.new(cc).validate!.must_equal true
    end

    it 'should be invalid' do
      cc = CreditCard.new('4111111111111')
      Validator.new(cc).validate!.must_equal false
    end
  end

  describe 'MasterCard' do
    it 'should be valid' do
      cc = CreditCard.new('5105105105105100')
      Validator.new(cc).validate!.must_equal true
    end

    it 'should be invalid' do
      cc = CreditCard.new('5105105105105106')
      Validator.new(cc).validate!.must_equal false
    end
  end

  describe 'AMEX' do
    it 'should be valid' do
      cc = CreditCard.new('378282246310005')
      Validator.new(cc).validate!.must_equal true
    end

    it 'should be invalid' do
      cc = CreditCard.new('378282246310035')
      Validator.new(cc).validate!.must_equal false
    end
  end

  describe 'Discover' do
    it 'should be valid' do
      cc = CreditCard.new('6011111111111117')
      Validator.new(cc).validate!.must_equal true
    end

    it 'should be invalid' do
      cc = CreditCard.new('6011111111111127')
      Validator.new(cc).validate!.must_equal false
    end
  end
end
