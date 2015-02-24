class HomeController < ApplicationController
  def index
    @count = Route.where.not(minutes1: nil).count
  end
end