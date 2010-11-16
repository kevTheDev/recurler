require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")


class SubscriptionTest < ActiveSupport::TestCase
  
  context 'recurly_billing_info_attributes' do
    
    setup do
      @billing_info = Recurler::BillingInfo.new({
        :first_name => 'John',
        :last_name  => 'jones',
        :address1   => 'top flat',
        :address2   => 'doosh road',
        :city       => 'Brighton',
        :state      => 'Sussex',
        :zip        => 'bn1',
        :country    => 'uk'
      })

      @credit_card  = Recurler::CreditCard.new({
        :number => '7653762378',
        :verification_value => '657',
        :year => '09',
        :month => '27'
      })
      
      
      @recurly_billing_info_attributes = {
        'first_name'  => 'John',
        'last_name'   => 'jones',
        'address1'    => 'top flat',
        'address2'    => 'doosh road',
        'city'        => 'Brighton',
        'state'       => 'Sussex',
        'zip'         => 'bn1',
        'country'     => 'uk',
        'credit_card' => {
          'number' => '7653762378',
          'verification_value' => '657',
          'year' => '09',
          'month' => '27'
        }
      }
      
      @subscription = Recurler::Subscription.new(:plan_code => 'basic')
      @subscription.billing_info = @billing_info
      @subscription.credit_card  = @credit_card
    end
    
    should 'return a hash of the billing_info and credit_card' do
      assert_equal @recurly_billing_info_attributes, @subscription.recurly_billing_info_attributes
    end
    
    
  end
  
  
  context 'creation' do
    setup do
      @billing_info = Recurler::BillingInfo.new({
        :first_name => 'John',
        :last_name  => 'jones',
        :address1   => 'top flat',
        :address2   => 'doosh road',
        :city       => 'Brighton',
        :state      => 'Sussex',
        :zip        => 'bn1',
        :country    => 'uk'
      })

      @credit_card  = Recurler::CreditCard.new({
        :number => '7653762378',
        :verification_value => '657',
        :year => '09',
        :month => '27'
      })
      
      @subscription = Recurler::Subscription.new(:plan_code => 'basic')
      @subscription.billing_info = @billing_info
      @subscription.credit_card  = @credit_card
    end
    
    should 'be valid' do
      assert @subscription.valid?
    end
    
    should 'validate_presence_of plan_code' do
      @subscription.plan_code = nil
      assert !@subscription.valid?
    end
    
    should 'validate billing_info' do
      @subscription.billing_info.first_name = nil
      assert !@subscription.valid?
    end
    
    should 'validate credit_card' do
      @subscription.credit_card.month = nil
      assert !@subscription.valid?
    end
    
  end

end