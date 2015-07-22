class StaticPagesController < ApplicationController
  def home
    @categories = Category.names
    @length = 6
  end
end
