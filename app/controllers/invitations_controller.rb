class InvitationsController < ApplicationController
    def new
        @event = Event.find(params[:id])
        @invitation = @event.invitations.build
        @users = User.all
    end

    def create
        @invitation = Invitation.new(invitation_params)

        if @invitation.save
            flash[:success] = "Invitation has been sent successfully"
            redirect_to root_path
        else
            flash[:error] = "Invitation could not be sent"
            render 'new'
        end
    end

    def accept
        @invitation = Invitation.find(params[:id])
        @invitation.event.attendees << current_user
        @invitation.destroy
        flash[:success] = 'Invitation Accepted.'
        redirect_to root_path
    end

    def decline
        @invitation = Invitation.find(params[:id])
        @invitation.destroy
        flash[:error] = 'Invitation Declined.'
        redirect_to root_path
    end



    private
    def invitation_params
        params.require(:invitation).permit(:receiver_id, :event_id)
    end

end
