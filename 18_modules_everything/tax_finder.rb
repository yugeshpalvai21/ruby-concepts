# =============================================================================
# 18b - MODULES AS NAMESPACED UTILITIES
# =============================================================================
# Modules also serve as pure namespaces for helper functions, grouping related
# behavior under a clear name (Order::TaxCollector) without needing instances.
# =============================================================================

module Order
  module TaxCollector
    # `class << self` opens the module's singleton class so every method below
    # becomes a module-level method: call them as Order::TaxCollector.xxx
    class << self
      # Tax is a PERCENTAGE of the subtotal (fixed from the old flat-amount bug).
      def find_tax(order_details)
        sub_total = order_details.fetch(:sub_total)
        rate      = tax_rate(order_details.fetch(:state))
        tax       = (sub_total * rate).round(2)
        {
          sub_total: sub_total,
          rate: rate,
          tax: tax,
          total: (sub_total + tax).round(2)
        }
      end

      def tax_rate(state)
        case state
        when "CA" then 0.10
        when "NY" then 0.20
        else 0.05            # default rate
        end
      end
    end
  end
end

puts "--- Deterministic examples (so output is stable) ---"
p Order::TaxCollector.find_tax(sub_total: 100, state: "CA")
# => {sub_total: 100, rate: 0.1, tax: 10.0, total: 110.0}

p Order::TaxCollector.find_tax(sub_total: 200, state: "NY")
# => {sub_total: 200, rate: 0.2, tax: 40.0, total: 240.0}

p Order::TaxCollector.find_tax(sub_total: 50, state: "TX")
# => {sub_total: 50, rate: 0.05, tax: 2.5, total: 52.5}

puts "\n--- Inspecting the namespace ---"
p Order::TaxCollector.class    # => Module
p Order::TaxCollector.tax_rate("NY") # => 0.2

# -----------------------------------------------------------------------------
# NOTE: an equivalent to `class << self` is `module_function` or defining each
# method as `def self.name`. `class << self` is handy when you have several.
# -----------------------------------------------------------------------------
