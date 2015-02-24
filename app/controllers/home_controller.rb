class HomeController < ApplicationController
  def index
    @count = Route.all.count
  end
end