class Api::MessagesController < ApplicationController

  def index
    @messages = Message.all.order(created_at: :desc)
    render "index.json.jb"
  end

  def create
    @message = Message.new(
      body: params[:body],
      user_id: current_user.id
    )
    @message.save

    ActionCable.server.broadcast "messages_channel", {
      id: @message.id,
      body: @message.body,
      user_id: @message.user_id,
      user_name: @message.user.name,
      created_at: @message.created_at
    }
    
    render "show.json.jb"
  end

end
