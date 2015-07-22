class ResourcesController < ApplicationController
  def show
    @resource = Resource.find(params[:id])
  end
  
  def index
    @category = params[:category]
    @resources = Resource.where("category_id = ?", @category[1])
  end

  def new
    @resource = Resource.new
  end

  def create
    @category = params[:category]
    @resource = Resource.new(resource_params)
    @resource.category_id = @category[1]
    if @resource.save
      redirect_to @resource
    else
      render 'new'
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :email, :position, :location, :company, :website)
  end
  
end
