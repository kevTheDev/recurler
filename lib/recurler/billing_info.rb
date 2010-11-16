module Recurler
  
  class BillingInfo
    
    include ActiveModel::Serialization
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :first_name, :last_name, :address1, :address2, :city, :state, :zip, :country
  
    validates_presence_of :first_name, :last_name, :address1, :address2, :city, :state, :zip, :country
  
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  
    def persisted?
      false
    end
    
    def attributes
      @attributes ||= {'first_name' => 'nil', 'last_name' => 'nil', 'address1' => 'nil', 'address2' => 'nil', 'city' => 'nil', 'state' => 'nil', 'zip' => 'nil', 'country' => 'nil'}
    end
    
  end

end