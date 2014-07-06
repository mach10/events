class EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  respond_to :xml, :json

  def index
  end

  def create
    @event = Event.new(post_params)
    if @event.save
      respond_to do |format|
        format.xml { head :created, location: @event }
      end
    else
      respond_to do |format|
        format.xml { head :unprocessable_entity }
      end
    end

  end

  def event
    @event = Event.find(params[:id])
  end

  private

  def post_params
    puts 'in post params'
    puts params
    params.require(:event).permit(:title, :description, :owner, :start)
  end
end
