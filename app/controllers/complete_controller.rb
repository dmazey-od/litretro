class CompleteController < ApplicationController
  before_action :authenticate_user!

  def index
    @retro = Retro.find(params[:id])

    @all_cards = []
    @retro.columns.each do |column|
      @all_cards += column.cards
    end

    if @retro.user_allowed(current_user.id)
      render
    else
      redirect_to '/retros', alert: 'Not permitted'
    end
  end
end
