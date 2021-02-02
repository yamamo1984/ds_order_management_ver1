class OrdersController < ApplicationController
  def index
  end  

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end    
end
