module Recurler
  
  class Account < ActiveResource::Base
    
    
    # temp vars - we will move them to a config module/class
    attr_accessor :username, :site, :password, :subdomain
    
    
    
    
    
    
    include ActiveModel::Serialization
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming
  
    attr_accessor :account_code, :username, :first_name, :last_name, :email, :company_name
  
    validates_presence_of :account_code
  
    self.element_name = "account"
    self.primary_key = :account_code
    self.prefix = "/accounts/:account_code"

    self.site      = 'https://legallifeguard-test.recurly.com'
    self.user  = 'api-test@legallifeguard-test.com'
    self.password  = 'ba3b2fae09de4044bcb5c6aa969a7969'
    #self.subdomain = 'legallifeguard-test'
  
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
      
      # TODO - load this from YAML file at config/recurler.yml
      #self.username  = 'api-test@legallifeguard-test.com'
      
      #self.password  = 'ba3b2fae09de4044bcb5c6aa969a7969'
      #self.subdomain = 'legallifeguard-test'
    end
  
    def persisted?
      false
    end
    
    #Override element_path because this is a singular resource
    def self.element_path(id, prefix_options = {}, query_options = nil)
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      prefix_options.merge!(:account_code => id) if id
      # original: "#{prefix(prefix_options)}#{collection_name}/#{URI.escape id.to_s}.#{format.extension}#{query_string(query_options)}"
      "#{prefix(prefix_options)}.#{format.extension}#{query_string(query_options)}"
    end
    
    # element path
    def element_path(options = nil)
      self.class.element_path(to_param, options || prefix_options)
    end
    
    def to_param
      attributes[:account_code]
    end
    
    # Override collection_path because this is a singular resource
    def self.collection_path(prefix_options = {}, query_options = nil)
      prefix_options, query_options = split_options(prefix_options) if query_options.nil?
      # original: "#{prefix(prefix_options)}#{collection_name}.#{format.extension}#{query_string(query_options)}"
      "#{prefix(prefix_options)}#{element_name}.#{format.extension}#{query_string(query_options)}"
    end
    
    # patch instantiate_record so it marks result records as persisted
    def self.instantiate_record(record, prefix_options)
      # result = super
      #       result.instance_eval{ @persisted = true }
      #       result
      
      puts "RECORD: #{record.to_yaml}"
    end
    
  end

end