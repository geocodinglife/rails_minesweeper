class BoardsController < ApplicationController

  before_action :set_board, only: :show

  def index
    @boards = Board.all
    respond_to do |format|
      format.html
      format.json  { render json: @boards, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board, status: :ok }
    end
  end

  def create
    @board = Board.new(boards_params)

    respond_to do |format|
      if @board.save!
        format.html { redirect_to board_path(@board.id), notice: "Board was successfully created." }
        format.json { render json: @board, status: :created }
      else
        format.html { render :show, notice: @board.errors }
        format.json {  render json: @board.errors, status: 422}
      end
    end
  end

  private

  def boards_params
    params.require(:board).permit(:name, :email, :width, :height, :mines)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
