require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")

class SubscriptionPlanTest < ActiveSupport::TestCase

  context 'creation' do
    setup do
      @subscription_plan = Recurler::SubscriptionPlan.new({
        :plan_code             => '1234567812345678',
        :name             => '1234567812345678'
      })
    end
    
    should 'be valid' do
      assert @subscription_plan.valid?
    end
    
    should 'validate_presence_of plan_code' do
      @subscription_plan.plan_code = nil
      assert !@subscription_plan.valid?
    end

  end
    
end
