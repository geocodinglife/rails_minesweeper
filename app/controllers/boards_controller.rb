class BoardsController < ApplicationController
  before_action :set_board, only: :show

  def index
    @boards = Board.all
  end

  def show; end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(boards_params)
    return render :show, notice: @board.errors unless @board.save!

    redirect_to board_path(@board.id), notice: 'Board was successfully created.' if @board.save!
  end

  private

  def boards_params
    params.require(:board).permit(:name, :email, :width, :height, :mines)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
