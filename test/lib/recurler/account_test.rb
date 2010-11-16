require File.expand_path(File.dirname(__FILE__) + "/../../test_helper")

class AccountTest < ActiveSupport::TestCase

  context 'creation' do
    setup do
      @account = Recurler::Account.new({
        :account_code             => '1234567812345678',
      })
    end
    
    should 'be valid' do
      assert @account.valid?
    end
    
    should 'validate_presence_of account_code' do
      @account.account_code = nil
      assert !@account.valid?
    end

  end
    
end
