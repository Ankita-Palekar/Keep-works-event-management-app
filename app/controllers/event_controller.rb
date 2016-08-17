class EventController < ApplicationController
  def index
    @event = Event.includes(:users, :attendants).where(:id => params[:id]).first if params[:id].present?
    if @event.present?
      if(user_signed_in?)
        @user_attendants = @event.attendants.detect{|at|  at.user_id == current_user.id && @event.id == at.event_id}
        @message = (@user_attendants.attending ? "You are attending this event" : "You are not attending this event") if @user_attendants.present?          
      end
      @show_attendants_button = @user_attendants.blank? && (@event[:event_time].present? && @event[:event_time] > Time.zone.now)
    end
  end

  def attending
    @event = Event.where(:id => params[:id]).first
    @attendants = @event.attendants.create([{:event_id => params[:id], :user_id => current_user.id, :attending => params[:status]}]).first
    
    if @attendants.errors.present?
      flash[:errors] = "Your attendants could not be recorded"
    else
      flash[:success] = "Your attendance is successfully recorded"
    end

    respond_to do |format|
      format.json {render :json => flash}
    end
  end

end