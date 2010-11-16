require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")

class CreditCardTest < ActiveSupport::TestCase
    
  context 'serialization' do
    setup do
      @attrs = {
        'number'             => '1234567812345678',
        'verification_value' => '458',
        'year'               => '12',
        'month'              => '03'
      }
      
      @credit_card = Recurler::CreditCard.new(@attrs)
    end
    
    should 'return a hash of the attributes' do
      assert_equal @attrs, @credit_card.serializable_hash
    end
  end
  
  context 'creation' do
    setup do
      @credit_card = Recurler::CreditCard.new({
        :number             => '1234567812345678',
        :verification_value => '458',
        :year               => '12',
        :month              => '03'
      })
    end
    
    should 'be valid' do
      assert @credit_card.valid?
    end
    
    should 'validate_presence_of number' do
      @credit_card.number = nil
      assert !@credit_card.valid?
    end
    
    should 'validate_presence_of verification_value' do
      @credit_card.verification_value = nil
      assert !@credit_card.valid?
    end
    should 'validate_presence_of year' do
      @credit_card.year = nil
      assert !@credit_card.valid?
    end
    should 'validate_presence_of month' do
      @credit_card.month = nil
      assert !@credit_card.valid?
    end
    
  end
    
end
