class BoardsController < ApplicationController
  before_action :all_boards, only: [:index, :create, :update, :destroy]
  before_action :find_board, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  before_action :authenticate_user!
  def new
    # @board = Board.new
    @board = current_user.boards.new
  end

  def create
    # @board = Board.create(board_params)
    @board = current_user.boards.create(board_params)
  end

  def show
  end

  def update
    @board.update_attributes(board_params)

  end

  def destroy
    @board.destroy
    redirect_to :back #refreshes the page
  end

  private
    def all_boards
      @boards = Board.all.order('created_at DESC')
    end

    def board_params
      params.require(:board).permit(:title)
    end

    def find_board
      @board = Board.find(params[:id])
    end
end
