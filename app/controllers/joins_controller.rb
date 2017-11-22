class JoinsController < ApplicationController
   before_action :authenticate_user!

   def index
     @collection = Collection.find(params[:collection_id])
   end

   def create
     @join = current_user.joins.create(collection_id: params[:collection_id])

     @notification = @join.notifications.build(user_id: @join.collection.user_id )

     @notification.save


     unless @join.collection.user_id == current_user.id
       Pusher.trigger("user_#{@join.collection.user_id}_channel", 'join_created', {
            message: 'あなたの作成したイベントに新たな参加者がいます',
            unread_counts: Notification.where(user_id: @join.collection.user.id, read: false).count
          })
     end
     Pusher.trigger("user_#{@join.collection.user_id}_channel", 'notification_created', {
       unread_counts: Notification.where(user_id: @join.collection.user.id, read: false).count
     })

     redirect_to collection_url(@join.collection), notice: "#{@join.collection.user.name}さんのイベントに参加します"
   end

    def destroy
      @join = current_user.joins.find_by(collection_id: params[:collection_id]).destroy
      redirect_to collection_url(@join.collection), notice: "#{@join.collection.user.name}さんのイベントに不参加になりました"
    end
  end
