class Array
  # Joins an array of HTML-safe strings
  def html_join
    inject("".html_safe, :+)
  end
end