module Recurler
  
  class Account
    
    include ActiveModel::Serialization
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :account_code, :username, :first_name, :last_name, :email, :company_name
  
    validates_presence_of :account_code
  
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  
    def persisted?
      false
    end
    
  end

end