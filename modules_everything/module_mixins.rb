module Country
  def self.states_count country
    if country == "USA"
      55
    else
      "Un Known"
    end
  end
end

p Country.states_count "IND"