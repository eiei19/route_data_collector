namespace :main do
  task :run, [:first_id, :target_count] => :environment do |task, args|
    first_id = args.first_id.present? ? args.first_id : 1
    target_count = args.target_count.present? ? args.target_count : 100
    routes = Route.where("? <= id", first_id).limit(target_count)
    routes.each do |route|
      route.scrape
      sleep(3)
    end
  end
end