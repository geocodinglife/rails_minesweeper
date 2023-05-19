class HomeController < ApplicationController
  def index
    @boards = Board.limit(10).order(id: :desc)
  end
end
