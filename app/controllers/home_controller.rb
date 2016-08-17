class HomeController < ApplicationController
  
  def index
    process_params
    @result = {}
    @result[:events] = Event.filter(params)
    @result[:count] = Event.count
  end

  private 
  def process_params
    params.slice!(:limit, :page, :order)
    if params[:limit].present?
      params[:limit] = 10 if  params[:limit] < 0 
      params[:limit] = 50 if  params[:limit] > 50
      if params[:page].present?
        params[:page] = 1 if params[:page] < 1
        params[:offset] = (params[:page].to_i - 1) * params[:limit].to_i
      end
    end
  end
end