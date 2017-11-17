class JoinsController < ApplicationController
   before_action :authenticate_user!

   def index
     @collection = Collection.find(params[:collection_id])
   end

   def create
     @join = current_user.joins.create(collection_id: params[:collection_id])
     redirect_to collection_url(@join.collection), notice: "#{@join.collection.user.name}さんのイベントに参加します"
   end

    def destroy
      @join = current_user.joins.find_by(collection_id: params[:collection_id]).destroy
      redirect_to collection_url(@join.collection), notice: "#{@join.collection.user.name}さんのイベントに不参加になりました"
    end
  end
