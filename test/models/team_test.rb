require 'test_helper'

class TeamTest < ActiveSupport::TestCase
   def setup
      @team = teams(:test)
    end

    test "should not save project without data" do
        t = Team.new
        assert_not t.save
    end

    test "should not valid created_at nil" do
      @team.created_at = nil
      assert_not @team.valid?
    end

    test "should not valid updated_at older than created_at" do
      @team.updated_at = Time.now - 500
      assert_not @team.valid?
    end

    test "should not valid name to long" do
      @team.name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
      assert_not @team.valid?
    end

    test "should not valid name to short" do
      @team.name = "abcd"
      assert_not @team.valid?
    end

    test "should valid name" do
      @team.name = "abcde"
      assert @team.valid?
    end
end