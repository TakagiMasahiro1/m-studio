class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @pictures = Picture.includes(:user).order("created_at DESC")
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    picture = Picture.find(params[:id])
    picture.update(picture_params)
  end
  
  def show
    @comment = Comment.new
    @comments = @picture.comments.includes(:user)
  end

  def search
    @pictures = Picture.search(params[:keyword])
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :text, :account).merge(user_id: current_user.id)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
