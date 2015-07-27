class StaticPagesController < ApplicationController
  
  def home
    @categories = Category.names
  end
  
  def help
  end
  
  def about
  end
  
end
