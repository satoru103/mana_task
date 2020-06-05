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

  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card =Card.find(params[:id])
    @tasklists = Tasklist.where(user: current_user)
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to root_path
  end

  private
  def card_params
    params.require(:card).permit(:card_name,:content,:tasklist_id)
  end
end
