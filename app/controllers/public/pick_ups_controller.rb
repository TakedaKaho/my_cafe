class Public::PickUpsController < ApplicationController
    def index
     @pick_ups = PickUp.all.order(created_at: :desc)
    end 
    
    def show
     @pick_up = PickUp.find(params[:id])
    end

end
