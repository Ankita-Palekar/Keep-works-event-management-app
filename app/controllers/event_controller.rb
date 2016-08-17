class EventController < ApplicationController
  def index
    @event = Event.includes(:users, :attendants).where(:id => params[:id]).first if params[:id].present?
  end
end