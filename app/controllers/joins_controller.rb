class JoinsController < ApplicationController
   before_action :authenticate_user!

   def create
     @join = current_user.joins.create(collection_id: params[:collection_id])
     redirect_to collection_url(@join.collection_id), notice: "#{@join.collection.user.name}さんのイベントに参加します"
   end

    def destroy
      @join = current_user.joins.find_by(collection_id: params[:collection_id]).destroy      
      redirect_to collection_url(@join.collection_id), notice: "#{@join.collection.user.name}さんのイベントに不参加になりました"
    end
  end
