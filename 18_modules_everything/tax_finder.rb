# main concept of modules is to provide Utility Helpers - (NameSpacing, Mixins etc.. )

module Order
  module TaxCollector
    class << self  # this instantiate class object whenever Order::TaxCollector calls
      def find_tax order_details
        sub_total = order_details[:sub_total]
        tax_amount = state_tax order_details[:state]
        sub_total + tax_amount
      end

      def state_tax state
        if state == "A"
          0.10
        elsif state == "N"
          0.20
        else
          0.50
        end
      end
    end
  end
end

details = { 
            sub_total: rand(1..10), 
            state: [*"A".."Z"].sample 
          }
p details 
p Order::TaxCollector.find_tax details
p Order::TaxCollector.class
