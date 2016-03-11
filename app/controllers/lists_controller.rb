class ListsController < ApplicationController
  before_action :find_board
  before_action :find_list, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  before_action :authenticate_user!

  def create
    @list = @board.lists.create(list_params)
    @list.user_id = current_user.id
    @list.save #need to save the id-> might need to add if statement
    # require 'byebug'; byebug
    redirect_to @board

    # redirect_to :back

  end

  def show
  end

  def edit
  end

  def update
    @list.update_attributes(list_params)
    respond_with_bip(@list)
  end

  def destroy
    @list.destroy
    # redirect_to :back
    redirect_to @board

  end

  def sort
    # @board.lists.each_with_index do |list, index|
    #   list.update_attributes(position_id: index+1)
    #
    # end

    params[:list].each_with_index do |id, index|
      List.find(id).update_attribute(:position_id, index+1)
    end

    render nothing: true

  end

  private
    def list_params
      params.require(:list).permit(:listTitle, :board_id, :user_id, :position_id)
    end

    def find_board
      @board = Board.find(params[:board_id])
    end

    def find_list
      @list = List.find(params[:id])
    end
end
