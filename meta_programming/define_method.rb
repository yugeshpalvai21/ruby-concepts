class Area
  measures = %w(square rectangular circle)

  def pi_value 
    3.14
  end

  measures.each do |measure_name|
    define_method("#{measure_name}_area") do |details={}|
      if measure_name == "square"
        details[:width] * details[:height]
      elsif measure_name == "rectangular"
        0.5 * details[:width] * details[:height]
      elsif measure_name == "circle"
        pi_value * details[:radius] * details[:radius]
      else
        "Nothing"
      end
    end
  end


  # def square_area details={}
  #   details[:width] * details[:height]
  # end

  # def rectangular_area details={}
  #   0.5 * details[:width] * details[:height]
  # end

  # def circle_area details={}
  #   pi_value * details[:radius] * details[:radius]
  # end
end


area = Area.new
p area.square_area({width: 12, height: 19})
p area.rectangular_area({width: 12, height: 19})
p area.circle_area({radius: 10})

