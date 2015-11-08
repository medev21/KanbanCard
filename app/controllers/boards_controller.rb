class BoardsController < ApplicationController
  before_action :all_boards, only: [:index, :create]
  before_action :find_board, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  # def index
  #   @boards = Board.all
  #   respond_to do |format|
  #     format.html
  #     format.js
  #   end
  # end
  def new
    @board = Board.new
  end

  def create
    @board = Board.create(board_params)
  end

  def show
  end

  private
    def all_boards
      @boards = Board.all
    end

    def board_params
      params.require(:board).permit(:title)
    end

    def find_board
      @board = Board.find(params[:id])
    end
end
