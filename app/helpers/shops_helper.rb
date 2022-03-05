module ShopsHelper
  # 郵便番号表示
  def postcode_format(postcode)
    postcode.to_s.reverse.gsub(/(\d{4})(?=\d)/, '\1-').reverse
  end

  # 住所表示
  def full_address(prefecture, city, street)
    prefecture + city + street
  end
end
