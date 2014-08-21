require 'test_helper'

class EventsControllerTest < ActionController::TestCase


  def setup
    @attr={title: 'title', description: 'description', start: Time.now.getutc.to_i + 10000, owner: 231}
    @event = Event.new @attr
    @request.headers['Accept'] = 'text/xml'
  end

  test 'should get index' do
    @request.headers['Accept'] = 'text/html'
    get :index
    assert_response :success
  end

  test 'it should create an event' do
    post :create, event: {title: @event.title, description: @event.description, owner: @event.owner, start: @event.start}
    assert_response :created
  end

  test 'it should not create an event if input is invalid' do
    event = Event.new @attr.merge(start: 100) #event in the past
    post :create, event: {title: event.title, description: event.description, owner: event.owner, start: event.start}
    assert_response :unprocessable_entity
  end

  test 'it should return all a users events including those in the past' do
    get :owner, {id: 23}
    assert  @response.body.to_s.scan('<event>').size == 10
    assert_response :success
  end

  test 'it should return empty if a user has no events' do
    get :owner, {id: 55}
    assert_response :success
  end


end
