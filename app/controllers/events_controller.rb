class EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  respond_to :xml, :json, :html

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

  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @event.to_xml }
    end
  end

  #this is to show all an owners events.
  #TODO have a parameter or a header indicating pagination and if
  #absent return the first 10 only
  def owner
    events = Event.where(owner: params[:id]).order('created_at ASC')

    respond_to do |format|
      if events.nil?
        format.xml {render :xml => ''}
      else
        format.xml { render :xml => events.to_xml }
      end

    end
  end

  private

  def post_params
    params.require(:event).permit(:title, :description, :owner, :start)
  end
end

