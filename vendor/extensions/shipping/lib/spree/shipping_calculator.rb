module Spree #:nodoc:
  module ShippingCalculator

    def shipping_methods
      methods = ShippingMethod.all
      methods.select { |method| method.zone.in_zone?(address) }
    end
    
    # collection of available shipping countries
    def shipping_countries
      ShippingMethod.all.collect { |method| method.zone.country_list }.flatten.uniq
    end

  end
end