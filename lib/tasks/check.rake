namespace :check do
  desc "check and delete expired order(not be updated for a week) everyday"
  task daily: :environment do
    require 'date'
    time = DateTime.now - 7
    Order.all.each do |order|
      order.destroy if order.updated_at < time
    end
  end
end
