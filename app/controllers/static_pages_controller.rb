class StaticPagesController < ApplicationController
  def home
    @categories = Resource.categories
  end
end
