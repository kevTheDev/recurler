module Recurler
  class Subscription
    
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :plan_code, :billing_info, :credit_card

    validates_presence_of :plan_code
    validate :has_valid_credit_card
    validate :has_valid_billing_info
    
    def initialize(attributes={})
      attributes.each { |name, value|send("#{name}=", value) }
      
      if attributes[:billing_info_attributes]
        self.billing_info = BillingInfo.new(attributes[:billing_info_attributes]) 
      else
        self.billing_info = BillingInfo.new
      end
      
      if attributes[:credit_card_attributes]
        self.credit_card = CreditCard.new(attributes[:credit_card_attributes])
      else
        self.credit_card = CreditCard.new
      end
    end
    
    def credit_card_attributes=(attributes)
      self.credit_card = CreditCard.new(attributes)
    end

    def credit_card_attributes
      @credit_card
    end
    
    def billing_info_attributes=(attributes)
      self.billing_info = BillingInfo.new(attributes)
    end

    def billing_info_attributes
      @billing_info
    end
    
    def persisted?
      false
    end

    def has_valid_billing_info
      errors.add(:base, billing_info.errors) unless self.billing_info.valid?
    end
     
    def has_valid_credit_card
      errors.add(:base, credit_card.errors) unless credit_card.valid?
    end
    
    def recurly_billing_info_attributes
      attrs = @billing_info.serializable_hash
      attrs['credit_card'] = @credit_card.serializable_hash
      attrs
    end
    
    # if recurly subscription call fails, then we need to 
    # display their validation errors on our form
    def merge_recurly_validation_errors
      
    end
    
  end
  
end