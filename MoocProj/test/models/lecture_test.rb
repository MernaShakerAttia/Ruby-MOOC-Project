require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Lecture will not save content is require" do
      lecture = Lecture.new
      assert_not lecture.save
    end
end
