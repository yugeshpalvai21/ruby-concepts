# =============================================================================
# 05 - HASHES
# =============================================================================
# A Hash maps keys to values (like a dictionary). Keys are usually symbols.
# =============================================================================

puts "--- Creating hashes ---"
# Symbol keys (most common, idiomatic):
person = { name: "yugesh", role: "engineer", location: "IND" }
p person

# Arbitrary keys use the hash-rocket (=>):
prices = { "apple" => 30, "banana" => 10 }
p prices

# Default value for missing keys:
counter = Hash.new(0)   # missing key returns 0 instead of nil
counter[:hits] += 1
p counter               # => {hits: 1}
p counter[:never_set]   # => 0

puts "\n--- Reading values ---"
p person[:name]          # => "yugesh"
p person[:missing]       # => nil (no error)
p person.fetch(:role)    # => "engineer"
p person.fetch(:missing, "N/A") # => "N/A" (default if absent)
p person.dig(:name)      # => "yugesh" (safe for nested hashes)
p person.values_at(:name, :role) # => ["yugesh", "engineer"]

puts "\n--- Nested access with dig ---"
config = { db: { host: "localhost", port: 5432 } }
p config.dig(:db, :port)       # => 5432
p config.dig(:db, :missing)    # => nil (no crash)

puts "\n--- Writing & deleting ---"
person[:email] = "yugesh@example.com"  # add/update
person.delete(:location)               # remove
p person
p person.merge(role: "lead")           # => new hash with role overridden
person.store(:active, true)            # same as person[:active] = true
p person[:active]                       # => true

puts "\n--- Inspecting ---"
p person.keys          # => [:name, :role, :email, :active]
p person.values        # => ["yugesh", "engineer", "yugesh@example.com", true]
p person.key?(:name)   # => true  (also has_key? / include?)
p person.value?("engineer") # => true (also has_value?)
p person.length        # => 4
p person.empty?        # => false
p person.to_a          # => [[:name, "yugesh"], ...] (array of pairs)

puts "\n--- Iterating ---"
scores = { math: 90, science: 85, art: 78 }
scores.each { |subject, score| puts "#{subject}: #{score}" }

puts "\n--- Transforming (returns new hashes) ---"
p scores.map { |k, v| [k, v + 5] }.to_h  # bump every score
p scores.transform_values { |v| v + 5 }  # cleaner: {math: 95, ...}
p scores.transform_keys(&:to_s)          # symbol keys -> string keys
p scores.select { |_k, v| v >= 85 }      # => {math: 90, science: 85}
p scores.reject { |_k, v| v >= 85 }      # => {art: 78}
p scores.min_by { |_k, v| v }            # => [:art, 78]
p scores.max_by { |_k, v| v }            # => [:math, 90]
p scores.sort_by { |_k, v| -v }          # => [[:math,90],[:science,85],[:art,78]]
p scores.sum { |_k, v| v }               # => 253
p scores.group_by { |_k, v| v >= 85 ? :pass : :low }

puts "\n--- Merging ---"
defaults = { color: "black", size: "M" }
chosen   = { size: "L" }
p defaults.merge(chosen) # => {color: "black", size: "L"} (right wins)
# Resolve conflicts with a block:
p({ a: 1 }.merge({ a: 10 }) { |_key, old, new| old + new }) # => {a: 11}

puts "\n--- Hashes <-> keyword args ---"
def greet(name:, greeting: "Hello")
  "#{greeting}, #{name}!"
end
opts = { name: "Yugesh", greeting: "Hi" }
p greet(**opts) # => "Hi, Yugesh!" (double-splat a hash into keyword args)
