class CardsController < ApplicationController
  before_action :set_card,only:[:show,:edit,:update,:destroy]

  def new
    @card = Card.new
    @tasklist = Tasklist.find(params[:tasklist_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to root_path
    else
      flash[:notice]="新しいタスクリストを作成しました"
      render "new"
    end
  end

  def show
  end

  def edit
    @tasklists = Tasklist.where(user: current_user)
  end

  def update
    if @card.update_attributes(card_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @card.destroy
    flash.now[:notice]="削除に成功しました"
    redirect_to root_path
  end

  def set_card 
    @card = Card.find(params[:id])
  end 

  private
  def card_params
    params.require(:card).permit(:card_name,:content,:tasklist_id)
  end
end
