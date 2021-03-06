require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = messages(:test)
  end

  test "should not save message without data" do
      m = Message.new
      assert_not m.save
  end

  test "should not valid read bevore send" do
      @message.is_read = true
      assert_not @message.valid?
  end

  test "should not valid resived bevore send" do
      @message.is_receive = true
      assert_not @message.valid?
  end

  test "should not valid read bevore resived" do
      @message.is_send = true
      @message.is_read = true
      assert_not @message.valid?
  end

  test "should not valid created_at nil" do
      @message.created_at = nil
      assert_not @message.valid?
  end

  test "should not valid updated_at older than created_at" do
      @message.updated_at = Time.now - 500
      assert_not @message.valid?
  end

  test "should not valid empty message body" do
      @message.encrypted_body = ""
      assert_not @message.valid?
  end

end