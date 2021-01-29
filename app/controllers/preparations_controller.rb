class PreparationsController < ApplicationController
  def create
    @preparation = Preparation.new(preparation_params)
    if @preparation.valid?
      binding.pry
      @preparation.save
      redirect_to root_path
    else
      render root_path
    end
  end
  private
  
  def preparation_params
    params.permit(:medicine_id).merge(user_id: current_user.id)
  end
end
