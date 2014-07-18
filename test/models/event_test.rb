require 'test_helper'

class EventTest < ActiveSupport::TestCase

  # called before every single test - essentiall a call back
  # so could have a method name as a symbol eg setup :initialize_event
  SAVED_TITLE = 'saved title'

  def setup
    @attr={title: 'title', description: 'description', start: Time.now.getutc.to_i + 10000, owner: 231}
    @event  = Event.new @attr
    @saved_event = Event.create @attr.merge title: SAVED_TITLE
  end

  test "the truth" do
     assert true
  end

  test "should be valid event" do
   assert @event.valid?
  end

  test "should be invalid event" do
    @event = Event.new @attr.merge(start: 100)
    assert @event.invalid?
  end

  test "it should return the first event" do
     event = Event.last
    assert event.title == SAVED_TITLE
  end

end
