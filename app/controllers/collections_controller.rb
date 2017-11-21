class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @collections = Collection.search(params[:search]).page(params[:page])
    flash.now[:notice] = Collection.set_flash_message(params[:search])
  end

  def show
    @comment = @collection.comments.build
    @comments = @collection.comments
    @join = current_user.joins.find_by(collection_id: @collection.id)
    @keep = current_user.keeps.find_by(collection_id: @collection.id)
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

  def new
    @collection = Collection.new
  end

  def edit
    @collection.picture.cache! unless @collection.picture.blank?
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
    if @collection.save
      redirect_to collections_path
      NoticeMailer.sendmail_collection(@collection).deliver
    else
      render 'new'
    end
  end

  def update
    if @collection.update(collection_params)
      redirect_to collections_path
    else
      render 'edit'
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path
  end

  private

    def set_collection
      @collection = Collection.find(params[:id])
    end


    def collection_params
      params.require(:collection).permit(:title, :content, :place, :url, :capacity, :starttime, :endtime, :date, :picture,:picture_cache)
    end
end
