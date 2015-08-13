class StaticPagesController < ApplicationController
  
  def home
    @categories = Resource.names
    @comments = Comment.order("created_at desc").limit(5)
  end
  
  def help
  end
  
  def about
  end
  
end
