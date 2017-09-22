class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @collections = Collection.all
  end

  def show
  end

  def new
    @collection = Collection.new
  end

  def edit
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user_id = current_user.id
      if @collection.save
        redirect_to collections_path
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
     redirect_to questions_path
  end

  private

    def set_collection
      @collection = Collection.find(params[:id])
    end


    def collection_params
     params.require(:collection).permit(:title, :content, :place, :starttime, :endtime, :date)
    end
end
