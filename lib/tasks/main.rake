namespace :main do
  task :run => :environment do |task, args|
    loop do
      route = Route.where(minutes1: nil, tried: false).first
      route.scrape
      sleep(3)
    end
  end
end