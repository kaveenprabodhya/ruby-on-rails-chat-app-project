class MessagesController < ApplicationController

    def create
        @message = Message.new(body: params[:session][:body])
        @message.user = User.find(session[:user_id])

        if @message.save
          ActionCable.server.broadcast("chatroom_channel", {mod_message: message_render(@message)})
        else
          flash[:negative] = "Something went wrong"
          redirect_to root_path
        end
    end
    
    private
      def message_params
        params.require(:message).permit(:body)
      end

      def message_render(message)
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.append(:message_container, partial: "message", locals: {message: message})
          end
        end

        # render(partial: 'message', locals: {message: message})
      end
end