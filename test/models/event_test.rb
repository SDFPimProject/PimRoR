require 'test_helper'

    # title: "test"
    # description: "test"
    # start_time: <%= Time.now + 500 %>
    # end_time: <%= Time.now + 1500 %>
    # creator: "user_id=1"
    # created_at: <%= Time.now %>
    # updated_at: <%= Time.now + 250 %>


class EventTest < ActiveSupport::TestCase

  def setup
    @event = events(:test)
  end

  test "should not save user without data" do
    event = Event.new
    assert_not event.save
  end

  test "should not validate empty title" do
    @event.title = ""
    assert_not @event.valid?
  end

  test "should not validate title to long" do
    @event.title = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw"
    assert_not @event.valid?
  end

  test "should validate title max length" do
    @event.title = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuv"
    assert @event.valid?
  end

  test "should validate title min length" do
    @event.title = "abcde"
    assert @event.valid?
  end

  test "should validate title to short" do
    @event.title = "abcd"
    assert_not @event.valid?
  end
  
  test "should not valid title of blanks" do
    @event.title = "      "
    assert_not @event.valid?
  end

  test "should not valid description of blanks" do
    @event.description = "      "
    assert_not @event.valid?
  end

  test "should not valid end_time older than start_time" do
    @event.start_time = Time.now
    @event.end_time = Time.now - 1000
    assert_not @event.valid?
  end

  test "should valid end_time younger than start_time" do
    @event.start_time = Time.now
    @event.end_time = Time.now + 1000
    assert @event.valid?
  end

  test "should valid end_time equals start_time" do
    @event.start_time = Time.now
    @event.end_time = @event.start_time
    assert @event.valid?
  end

  test "should not valid start_time nil" do
    @event.start_time = nil
    assert_not @event.valid?
  end

  test "should not valid end_time nil" do
    @event.end_time = nil
    assert_not @event.valid?
  end
  
  test "should not valid end_time and start_time equals nil" do
    @event.start_time = nil
    @event.end_time = nil
    assert_not @event.valid?
  end

  test "should not valid creator empty" do
    @event.creator = ""
    assert_not @event.valid?
  end

  test "should not valid creator team missing id" do
    @event.creator = "team_id="
    assert_not @event.valid?
  end

  test "should not valid creator user missing id" do
    @event.creator = "user_id="
    assert_not @event.valid?
  end
  
  test "should not valid creator project missing id" do
    @event.creator = "project_id="
    assert_not @event.valid?
  end

  test "should not valid creator wrong team format" do
    @event.creator = "teamid=1"
    assert_not @event.valid?
  end

  test "should not valid creator wrong user format" do
    @event.creator = "userid=1"
    assert_not @event.valid?
  end
  
  test "should not valid creator wrong project format" do
    @event.creator = "projectid=1"
    assert_not @event.valid?
  end

  test "should not valid creator wrong team id" do
    @event.creator = "team_id=-1"
    assert_not @event.valid?
  end

  test "should not valid creator wrong user id" do
    @event.creator = "user_id=-1"
    assert_not @event.valid?
  end
  
  test "should not valid creator wrong project id" do
    @event.creator = "project_id=-1"
    assert_not @event.valid?
  end

  test "should valid creator team id" do
    @event.creator = "team_id=1"
    assert @event.valid?
  end

  test "should valid creator user id" do
    @event.creator = "user_id=1"
    assert @event.valid?
  end
  
  test "should valid creator project id" do
    @event.creator = "project_id=1"
    assert @event.valid?
  end
  
  test "should not valid created_at nil" do
      @event.created_at = nil
      assert_not @event.valid?
  end

  test "should not valid updated_at older than created_at" do
      @event.updated_at = Time.now - 500
      assert_not @event.valid?
  end

end
