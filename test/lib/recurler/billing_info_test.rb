require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")

class BillingInfoTest < ActiveSupport::TestCase
  
  context 'serializable_hash' do
    
    setup do
      @attrs = {
        'first_name' => 'Kelvin',
        'last_name'  => 'Jones',
        'address1'   => 'Flat 12',
        'address2'   => 'Test street',
        'city'       => 'Brighton',
        'state'      => 'Sussex',
        'zip'        => 'BN2 34F',
        'country'    => 'UK'
      }
      
      @billing_info = Recurler::BillingInfo.new(@attrs)
    end
    
    should 'return a hash of the attributes' do
      assert_equal @attrs, @billing_info.serializable_hash
    end
    
  end
  
  context 'creation' do
    setup do
      @billing_info = Recurler::BillingInfo.new({
        :first_name => 'Kelvin',
        :last_name  => 'Jones',
        :address1   => 'Flat 12',
        :address2   => 'Test street',
        :city       => 'Brighton',
        :state      => 'Sussex',
        :zip        => 'BN2 34F',
        :country    => 'UK'
      })
    end
    
    should 'be valid' do
      assert @billing_info.valid?
    end
    
    should 'validate_presence_of first_name' do
      @billing_info.first_name = nil
      assert !@billing_info.valid?
    end
    
    should 'validate_presence_of last_name' do
      @billing_info.last_name = nil
      assert !@billing_info.valid?
    end
    
    should 'validate_presence_of address1' do
      @billing_info.address1 = nil
      assert !@billing_info.valid?
    end
    
    should 'validate_presence_of address2' do
      @billing_info.address2 = nil
      assert !@billing_info.valid?
    end
    
    should 'validate_presence_of city' do
      @billing_info.city = nil
      assert !@billing_info.valid?
    end
    
    should 'validate_presence_of state' do
      @billing_info.state = nil
      assert !@billing_info.valid?
    end
    
    should 'validate_presence_of zip' do
      @billing_info.zip = nil
      assert !@billing_info.valid?
    end
    
    should 'validate_presence_of country' do
      @billing_info.country = nil
      assert !@billing_info.valid?
    end
    
  end

end
