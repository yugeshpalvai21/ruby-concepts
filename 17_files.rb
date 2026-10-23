# =============================================================================
# 17 - FILES & I/O
# =============================================================================
# Reading from and writing to files. This demo creates a scratch file, works
# with it, then deletes it, so the script is self-contained and repeatable.
# =============================================================================

require "json"

# __dir__ is the directory of THIS file (cleaner than File.dirname(__FILE__)).
scratch = File.join(__dir__, "scratch_demo.txt")

puts "--- Writing a whole file (truncates/creates) ---"
File.write(scratch, "line one\nline two\n")
puts "wrote #{File.size(scratch)} bytes to #{File.basename(scratch)}"

puts "\n--- Appending ---"
File.open(scratch, "a") { |f| f.puts "line three" } # "a" = append mode
# The block form auto-closes the file even if an error is raised.

puts "\n--- Reading the whole file as one string ---"
puts File.read(scratch)

puts "--- Reading into an array of lines ---"
p File.readlines(scratch, chomp: true) # => ["line one", "line two", "line three"]

puts "\n--- Reading line by line (memory-friendly for big files) ---"
File.foreach(scratch).with_index(1) do |line, num|
  puts "#{num}: #{line.chomp}"
end

puts "\n--- Open modes quick reference ---"
# "r"  read (default)         "w"  write, truncate/create
# "a"  append/create          "r+" read+write
# "b"  binary (combine, e.g. "rb")
File.open(scratch, "r") do |f|
  puts "first line only: #{f.readline.chomp}"
end

puts "\n--- Checking the filesystem ---"
p File.exist?(scratch)   # => true
p File.file?(scratch)    # => true
p File.directory?(__dir__) # => true
p File.extname(scratch)  # => ".txt"
p File.basename(scratch) # => "scratch_demo.txt"

puts "\n--- Pathname: an object-oriented path API ---"
require "pathname"
# NOTE (Ruby 4.0): Pathname became a core class (no require needed on 4.0+).
path = Pathname.new(scratch)
p path.extname      # => ".txt"
p path.exist?       # => true
p path.dirname.to_s == __dir__ # => true

puts "\n--- Working with structured data (JSON round-trip) ---"
json_path = File.join(__dir__, "scratch_demo.json")
data = { name: "yugesh", skills: %w[ruby rails] }
File.write(json_path, JSON.pretty_generate(data))
loaded = JSON.parse(File.read(json_path), symbolize_names: true)
p loaded            # => {name: "yugesh", skills: ["ruby", "rails"]}

puts "\n--- Listing a directory ---"
p Dir.children(__dir__).sort.first(3) # first few entries (no "." / "..")

puts "\n--- Cleanup (delete the scratch files) ---"
File.delete(scratch) if File.exist?(scratch)
File.delete(json_path) if File.exist?(json_path)
puts "scratch files removed? #{!File.exist?(scratch) && !File.exist?(json_path)}"
