module Recurler
  
  class Account < ActiveResource::Base
    
    # TODO - load this from YAML file at config/recurler.yml
    self.username  = 'api-test@legallifeguard-test.com'
    self.site      = 'https://legallifeguard.recurly.com'
    self.password  = 'ba3b2fae09de4044bcb5c6aa969a7969'
    self.subdomain = 'legallifeguard-test'
    
    include ActiveModel::Serialization
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :account_code, :username, :first_name, :last_name, :email, :company_name
  
    validates_presence_of :account_code
  
    self.element_name = "account"
    self.primary_key = :account_code
  
  
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