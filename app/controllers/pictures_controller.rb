class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:edit, :update, :destroy]
  def index
    @pictures = Picture.all.order(:created_at => 'desc')
  end

  def edit
  end

  def new
    Rails.logger.info "new was called."
    if @picture
      Rails.logger.info "new with pacture_params"
      @picture = Picture.new(picture_params)
    else
      Rails.logger.info "new dake"
      @picture = Picture.new
    end
  end

  def create
    #Picture.create(picture_params)
    Rails.logger.info "create was called"
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if @picture.save(picture_params)
      NoticeMailer.sendmail_picture(@picture).deliver
      redirect_to pictures_path, notice: "投稿を作成しました"
    else
      render 'new'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました"
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました"
    else
      render 'edit'
    end
  end

private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:title, :comment, :image)
  end
end
