require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
    @event = events(:test)
  end

  test "should not save user without data" do
    event = Event.new
    assert_not event^^.save
  end
end
