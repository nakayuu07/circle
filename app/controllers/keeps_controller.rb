class KeepsController < ApplicationController
  before_action :authenticate_user!

  def create
    @keep = current_user.keeps.create(collection_id: params[:collection_id])
    redirect_to collection_url(@keep.collection_id), notice: "#{@keep.collection.user.name}さんのイベントをキープしました"
  end

  def destroy
    @keep = current_user.keeps.find_by(collection_id: params[:collection_id]).destroy
    redirect_to collection_url(@keep.collection_id), notice: "#{@keep.collection.user.name}さんのイベントのキープを解除しました"
  end
end
