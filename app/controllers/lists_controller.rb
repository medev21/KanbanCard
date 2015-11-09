class ListsController < ApplicationController
  before_action :find_board

  def create
    @list = @board.lists.create(list_params)
  end

  private
    def find_board
      @board = Board.find(params[:board_id])
    end

    def list_params
      params.require(:list).permit(:listTitle)
    end
end
