class Array
  # Adding new method to core functionality
  def multiply_all
    self.reduce { |result, num| (result.to_i) * ( num.to_i == 0 ? 1 : num) } 
  end

  # Overriding inbuilt Array method
  def sum
    "Opps!!! Overring default method"
  end
end

p [1, 2, 4, 6, 'fdf', 'dfsdf', 2].multiply_all
p [1,2].sum