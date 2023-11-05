class Array
  # Adding new method to core functionality
  def multiply_all
    self.reduce(1) { |result, num| (result) * ( num.to_i == 0 ? 1 : num) } 
  end

  # Overriding inbuilt Array method
  def sum
    "Opps!!! Overring default method"
  end
end

p ["gjhgjh", 2, 4, 6, 'fdf', 'dfsdf', 2].multiply_all
p [1,2].sum
