require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  @attr = {title: 'test', description: 'description', start: 1405369749, owner: 23}

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'it should create an event' do
    event = Event.new
    event.title='title'
    event.description='description'
    event.start=1405369749
    event.owner=23

    post :create
    assert_response :created
  end



end
