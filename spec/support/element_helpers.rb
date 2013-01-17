module ElementHelpers
  def to_element(string, type)
    Nokogiri::HTML(string.to_s).at_xpath(".//#{type}")
  end
end

class String
  def to_element
    Nokogiri::HTML(self).at_css("body").children.first
  end
end