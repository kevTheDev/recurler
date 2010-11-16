module Recurler
  
  class SubscriptionPlan
    
    include ActiveModel::Serialization
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :plan_code, :name, :description, :success_url, :cancel_url, :created_at
  
    validates_presence_of :plan_code, :name
  
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