require 'test_helper'

class EventsControllerTest < ActionController::TestCase


  def setup
    @attr={title: 'title', description: 'description', start: Time.now.getutc.to_i + 10000, owner: 231}
    @event = Event.new @attr
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'it should create an event' do
    @request.headers['Accept'] = 'text/xml'
    post :create, event: {title: @event.title, description: @event.description, owner: @event.owner, start: @event.start}
    assert_response :created
  end

  test 'it should not create an event if input is invalid' do
    @request.headers['Accept'] = 'text/xml'
    event = Event.new @attr.merge(start: 100) #event in the past
    post :create, event: {title: event.title, description: event.description, owner: event.owner, start: event.start}
    assert_response :unprocessable_entity
  end


end
