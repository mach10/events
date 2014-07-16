require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "the truth" do
     assert true
  end


  def get_event
    event = Event.new
    event.title = "title"
    event.owner = 23
    event.start = Time.now.getutc.to_i + 1000
    event
  end

  test "should be valid user" do

    assert get_event.valid?
  end


end
