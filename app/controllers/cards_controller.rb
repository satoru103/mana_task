class CardsController < ApplicationController
  def new
    @card = Card.new
    @tasklist = Tasklist.find(params[:tasklist_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to root_path
    else
      render "new"
    end
  end

  private
  def card_params
    params.require(:card).permit(:card_name,:content,:tasklist_id)
  end
end
