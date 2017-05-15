require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Course will not save title is require" do
      course = Course.new
      assert_not course.save
    end
end
