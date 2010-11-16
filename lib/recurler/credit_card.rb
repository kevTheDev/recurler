module Recurler
  class CreditCard
    
    include ActiveModel::Serialization
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :number, :verification_value, :year, :month
  
    validates_presence_of :number, :verification_value, :year, :month
  
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  
    def persisted?
      false
    end
    
    def attributes
      @attributes ||= {'number' => 'nil', 'verification_value' => 'nil', 'year' => 'nil', 'month' => 'nil'}
    end
  end
  
end