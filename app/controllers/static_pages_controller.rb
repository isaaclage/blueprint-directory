class StaticPagesController < ApplicationController
  
  def home
    @categories = Resource.names
  end
  
  def help
  end
  
  def about
  end
  
end
