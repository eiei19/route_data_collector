require 'open-uri'
class Route < ActiveRecord::Base
  REMOVE_REGEX = /(\r\n|\r|\n|\s|　|\[|\])/
  def scrape
    service_url = "http://www.navitime.co.jp/transfer/search"
    params = {
      orvStationName: from,
      dnvStationName: to,
      month: "2015/2",
      day: "22",
      hour: "12",
      minute: "0"
    }
    params_string = params.map{|key, value| "#{key}=#{value}"}.join("&")
    url = URI.escape(service_url+"?"+params_string)

    html = URI.parse(url).read.force_encoding('UTF-8')
    doc = Nokogiri.HTML(html, nil, "UTF-8")

    doc.css("#routesum_area .emphasis_time").each_with_index do |element, index|
      p element.text.gsub(REMOVE_REGEX, "").gsub(/.*\(/, "").gsub(/\D/, "")
    end

    doc.css("#routesum_area .change_contents").each_with_index do |element, index|
      p element.text.gsub(REMOVE_REGEX, "").gsub(/.*\(/, "").gsub(/\D/, "")
    end
  end
end