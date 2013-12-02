require 'minitest/spec'
require 'minitest/autorun'
require './lib/validator.rb'

describe Validator do
  describe 'VISA' do
    it 'should be valid' do
      Validator.new('4111111111111111').validate!.must_equal true
    end

    it 'should be invalid' do
      Validator.new('4111111111111').validate!.must_equal false
    end
  end

  describe 'MasterCard' do
    it 'should be valid' do
      Validator.new('5105105105105100').validate!.must_equal true
    end

    it 'should be invalid' do
      Validator.new('5105105105105106').validate!.must_equal false
    end
  end

  describe 'AMEX' do
    it 'should be valid' do
      Validator.new('378282246310005').validate!.must_equal true
    end

    it 'should be invalid' do
      Validator.new('378282246310035').validate!.must_equal false
    end
  end

  describe 'Discover' do
    it 'should be valid' do
      Validator.new('6011111111111117').validate!.must_equal true
    end

    it 'should be invalid' do
      Validator.new('6011111111111127').validate!.must_equal false
    end
  end
end
