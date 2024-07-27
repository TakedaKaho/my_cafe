class Admin::TagsController < ApplicationController
    before_action :authenticate_admin!

    def create
      @tag = Tag.new(tag_params)
      if @tag.save
        flash[:success] = "タグが正常に作成されました。"
        redirect_to admin_tags_path
      else
        flash.now[:error] = "タグの作成に失敗しました。"
        @tags = Tag.order(created_at: :desc).page(params[:page]).per(12)
        @tag_count = Tag.count
        render :index
      end 
    end
    
    def index
      @tag = Tag.new
      @tags = Tag.order(created_at: :desc).page(params[:page]).per(12)
      @tag_count = Tag.count
    end

    
    def edit
      @tag =Tag.find(params[:id])
    end 
    
    def update
     @tag =Tag.find(params[:id])
     if @tag.update(tag_params)
       flash[:tag_update_notice]="Tag名更新しました。"
       redirect_to admin_tags_path
     else
       render edit
     end
    end 
    
    def destroy
      @tag =Tag.find(params[:id])
      @tag.destroy
      flash[:tag_destroy_notice]="Tagを正常に削除しました。"
      redirect_to admin_tags_path
    end 
    
  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
