RSpec::Matchers.define :have_tag do |tag|
  match do |string|
    document = Nokogiri::HTML(string)
    !!document.at_css(tag)
  end
end

RSpec::Matchers.define :have_xpath do |tag|
  match do |string|
    document = Nokogiri::HTML(string)
    !!document.at_xpath(tag)
  end
end