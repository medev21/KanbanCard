class CardsController < ApplicationController
  before_action :find_board
  # before_action :find_list
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  # def new
  #
  #   @card = @list.cards.build
  # end

  def create
    @card = current_user.cards.create(card_params)
    @card.user_id = current_user.id

    @card.save

    redirect_to @board
  end

  def show
  end

  def update
    @card.update_attributes(card_params)
    # @card.list_id = @list.id
    respond_with_bip(@card)
  end

  def change_list_id

    @card.list_id = @list.id

    if @card.save
      render json: @card , status: 200
    else
      render json: @card , status: 404
    end
  end

  def destroy
    @card.destroy
    redirect_to @board
  end

  private
    def card_params
      params.require(:card).permit(:title, :list_id, :user_id )
    end
    #
    def find_board
      @board = Board.find(params[:board_id])
    end
    #
    #
    # def find_list
    #   @board = Board.find(params[:board_id])
    #   @list = @board.lists.where
    # end

    def find_card
      @card = Card.find(params[:id])
    end
end
