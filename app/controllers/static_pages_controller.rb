class StaticPagesController < ApplicationController
  def home
    @categories = Category.names
  end
end
