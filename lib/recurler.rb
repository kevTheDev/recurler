require 'rubygems'
require 'active_model'
require 'active_resource'

module Recurler


  autoload :Account,          'recurler/account'
  autoload :BillingInfo,      'recurler/billing_info'
  autoload :Subscription,     'recurler/subscription'
  autoload :CreditCard,       'recurler/credit_card'
  autoload :SubscriptionPlan, 'recurler/subscription_plan'
  
  
  # # TODO - load this from YAML file at config/recurler.yml
  #   self.username  = 'api-test@legallifeguard-test.com'
  #   self.site      = 'https://legallifeguard.recurly.com'
  #   self.password  = 'ba3b2fae09de4044bcb5c6aa969a7969'
  #   self.subdomain = 'legallifeguard-test'
  
end