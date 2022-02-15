module ShopsHelper
  def postcode_format(postcode)
    postcode.to_s.reverse.gsub(/(\d{4})(?=\d)/, '\1-').reverse
  end

  def full_address(prefecture, city, street)
    prefecture + city + street
  end
end
