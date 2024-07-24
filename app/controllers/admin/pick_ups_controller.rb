class Admin::PickUpsController < ApplicationController
 before_action :authenticate_admin!
    def new
      @pick_up = PickUp.new
    end 
    
    def create
      @pick_up = PickUp.new(pick_up_params)
      if @pick_up.save
        redirect_to admin_pick_up_path(@pick_up)
      else
        render :new
      end
    end
    
    def index
      @pick_ups = PickUp.order(created_at: :desc).page(params[:page]).per(20)
    end 
    
    def show
      @pick_up = PickUp.find(params[:id])
    end 
    
    def edit
      @pick_up = PickUp.find(params[:id])
    end 
    
    def update
      @pick_up = PickUp.find(params[:id])
       if @pick_up.update(pick_up_params)
         flash[:update_notice]="正常に変更内容が反映されました。"
         redirect_to admin_pick_up_path(@pick_up)
       else
         render :edit
       end
    end 
    
    def destroy
      @pick_up = PickUp.find(params[:id])
      @pick_up.destroy
      flash[:destroy_notice]="PickUp記事を正常に削除しました。"
      redirect_to admin_pick_ups_path
    end 
    
  private

    def pick_up_params
      params.require(:pick_up).permit(:title, :body, :post_id, :other_attributes, pick_up_images: [])
    end
    
end
