require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:name)
    @resource = resources(:name)
    @comment = @resource.comments.build(content: "Comment content")
    @comment.user_id = @user.id
  end

  test "should be valid" do
    assert @comment.valid?
  end

 # test "user id should be present" do
   # @comment.user_id = nil
   # assert_not @comment.valid?
 # end

  test "resource id should be present" do
    @comment.resource_id = nil
    assert_not @comment.valid?
  end
  
  test "content should be present" do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "order should be most recent first" do
    assert_equal comments(:most_recent), Comment.first
  end 

  test "associated comments should be destroyed" do
    @resource.save
    @resource.comments.create!(content: "Comment content", user_id: @user.id)
    assert_difference 'Comment.count', -1 do
      @resource.destroy
    end
  end
end
