class Board < ApplicationRecord
  validates_presence_of :name, :email, :width, :height, :mines
  before_create :generate_board_state

  def generate_board_state
    board_service = BoardService.new(width, height, mines)
    board_service.generate_board
    self.board_state = JSON.dump(board_service.board)
  end

  def parsed_board
    JSON.parse(board_state)
  end
end
