require 'open-uri'
class Route < ActiveRecord::Base
  REMOVE_REGEX = /(\r\n|\r|\n|\s|　|\[|\])/
  SERViCE_URL = "http://www.navitime.co.jp/transfer/search"
  def scrape
    if self.minutes1?
      return
    end

    reverse = Route.find_by(from: to, to: from)

    params = {
      orvStationName: from,
      dnvStationName: to,
      month: "2015/2",
      day: "22",
      hour: "12",
      minute: "0"
    }
    params_string = params.map{|key, value| "#{key}=#{value}"}.join("&")
    url = URI.escape(SERViCE_URL+"?"+params_string)

    html = URI.parse(url).read.force_encoding('UTF-8')
    doc = Nokogiri.HTML(html, nil, "UTF-8")

    doc.css("#routesum_area .emphasis_time").each_with_index do |element, index|
      i = (index+1).to_s
      time = element.text.gsub(REMOVE_REGEX, "").gsub(/.*\(/, "").split("時間").map{|v|v.gsub(/\D/, "").to_i}
      if time.count == 2
        minutes = (time[0]*60)+time[1]
      else
        minutes = time[0]
      end
      self[("minutes"+i).to_sym] = minutes
      reverse[("minutes"+i).to_sym] = minutes
    end

    doc.css("#routesum_area .change_contents").each_with_index do |element, index|
      i = (index+1).to_s
      transfers = element.text.gsub(REMOVE_REGEX, "").gsub(/.*\(/, "").gsub(/\D/, "").to_i
      self[("transfers"+i).to_sym] = transfers
      reverse[("transfers"+i).to_sym] = transfers
    end

    self.save
    reverse.save
  rescue
    return false
  end
end