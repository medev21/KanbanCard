class ListsController < ApplicationController
  before_action :find_board
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def create
    @list = @board.lists.create(list_params)
  end

  def show
  end

  def edit
  end

  def update
    @list.update_attributes(list_params)
    # respond_with @list
  end

  private
    def list_params
      params.require(:list).permit(:listTitle)
    end

    def find_board
      @board = Board.find(params[:board_id])
    end

    def find_list
      @list = List.find(params[:id])
    end
end
