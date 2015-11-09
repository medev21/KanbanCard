class BoardsController < ApplicationController
  before_action :all_boards, only: [:index, :create, :update, :destroy]
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
    # @board.update(board_params)
    # respond_with @board

    # respond_to do |format|
    #   if @user.update_attributes(board_params)
    #     format.html { redirect_to(@board, :notice => 'User was successfully updated.') }
    #     format.json { respond_with_bip(@board) }
    #   end
    # end
  end

  def destroy
    @board.destroy
    redirect_to root_path
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
