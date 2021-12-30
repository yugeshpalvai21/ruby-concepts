class Area
  measures = %w(square rectangular circle)

  def pi_value 
    3.14
  end

  measures.each do |measure_name|
    define_method("#{measure_name}_area") do |details={}|
      if measure_name == "square"
        details[:length] * details[:length]
      elsif measure_name == "rectangular"
        0.5 * details[:width] * details[:length]
      elsif measure_name == "circle"
        pi_value * details[:radius] * details[:radius]
      else
        "Nothing"
      end
    end
  end


  # def square_area details={}
  #   details[:length] * details[:length]
  # end

  # def rectangular_area details={}
  #   0.5 * details[:width] * details[:length]
  # end

  # def circle_area details={}
  #   pi_value * details[:radius] * details[:radius]
  # end
end


area = Area.new
p area.square_area length: 12
p area.rectangular_area width: 12, length: 19
p area.circle_area radius: 10

