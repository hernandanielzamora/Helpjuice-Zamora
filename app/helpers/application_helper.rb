module ApplicationHelper

  # Check if there are any posts in the database
  def any_posts?
    Post.exists?
  end
end
