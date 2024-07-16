class Public::PickUpsController < ApplicationController
 before_action :authenticate_user!
    def index
     @latest_pick_up = PickUp.order(created_at: :desc).first
     #allから最新の記事抜いてる
     @pick_ups = PickUp.where.not(id: @latest_pick_up.id).order(created_at: :desc).page(params[:page]).per(10)
    end 
    
    def show
     @pick_up = PickUp.find(params[:id])
    end

end
