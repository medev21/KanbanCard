class CardsController < ApplicationController
  before_action :find_board
  before_action :find_list
  before_action :find_cared, only: [:show, :edit, :update, :destroy]

  def create
    @card = @board.cards.create(card_params)
    @card.user_id = current_user.id
    @card.list_id = @list.id

    @card.save

    redirect_to @board
  end

  def show
  end

  def update
    @card.update_attributes(card_params)
    @card.list_id = @list.id
    respond_with_bip(@card)
  end

  def destroy
    @card.destroy
    redirect_to @board
  end

  private
    def card_params
      params.require(:card).permit(:title)
    end

    def find_board
      @board = Board.find(params[:board_id])
    end

    def find_list
      @list = List.find(params[:list_id])
    end

    def find_card
      @card = Card.find(params[:id])
    end
end
