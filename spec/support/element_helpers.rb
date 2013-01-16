module ElementHelpers
  def to_element(string, type)
    Nokogiri::HTML(string.to_s).at_xpath(".//#{type}")
  end
end