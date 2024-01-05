module ApplicationHelper

  # Check if there are any posts in the database
  def any_posts?
    @post = Post.first
    Post.exists?
  end
end
