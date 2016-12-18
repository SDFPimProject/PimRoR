require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
   def setup
      @project = projects(:test)
    end

    test "should not save project without data" do
        p = Project.new
        assert_not p.save
    end

    test "should not valid created_at nil" do
      @project.created_at = nil
      assert_not @project.valid?
    end

    test "should not valid updated_at older than created_at" do
      @project.updated_at = Time.now - 500
      assert_not @project.valid?
    end

    test "should not valid name to long" do
      @project.name = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
      assert_not @project.valid?
    end

    test "should not valid name to short" do
      @project.name = "abcd"
      assert_not @project.valid?
    end

    test "should valid name" do
      @project.name = "abcde"
      assert @project.valid?
    end
end
