require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  def setup
    @conversation = conversations(:test)
  end

  test "should not save conversation without data" do
      c = Conversation.new
      assert_not c.save
  end

  test "should not valid created_at nil" do
      @conversation.created_at = nil
      assert_not @conversation.valid?
  end

  test "should not valid updated_at older than created_at" do
      @conversation.updated_at = Time.now - 500
      assert_not @conversation.valid?
  end

  test "should not valid sender_id lower than zero" do
      @conversation.sender_id = -1
      assert_not @conversation.valid?
  end

  test "should not valid recipient_id lower than zero" do
      @conversation.recipient_id = -1
      assert_not @conversation.valid?
  end
end
