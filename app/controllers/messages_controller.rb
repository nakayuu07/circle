class MessagesController < ApplicationController

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last && @messages.last.user_id != current_user.id
      @messages.last.read = true
    end

    @message = @conversation.messages.build
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

  def create
    @message = @conversation.messages.build(message_params)
    message_received_user_id = @conversation.target_user(current_user).id
    @notification = @message.notifications.build(user_id: message_received_user_id)

    @notification.save

    if @message.save && message_received_user_id != current_user.id
      Pusher.trigger("user_#{message_received_user_id}_channel", 'message_created', {
        message: '新たなメッセージが届きました'
      })

      Pusher.trigger("user_#{message_received_user_id}_channel", 'notification_created', {
      unread_counts: Notification.where(user_id: message_received_user_id, read: false).count
      })
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
