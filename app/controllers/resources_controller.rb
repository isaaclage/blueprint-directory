class ResourcesController < ApplicationController
  def show
    @resource = Resource.find(params[:id])
    @category_id = @resource.category_id
    @category_name = Resource.names.key(@category_id)
    @comments = @resource.comments.all
    @num_comments = @resource.comments.count
  end
  
  def index
    @category_id = params[:category].to_i
    @category_name = Resource.names.key(@category_id)
    @resources = Resource.where("category_id = ?", @category_id)
  end

  def new
    @category_id = params[:category].to_i
    @category_name = Resource.names.key(@category_id)
    @resource = Resource.new
  end

  def create
    @resource = Resource.create(resource_params)
    if @resource.save
      redirect_to @resource
    else
      render 'new'
    end
  end

  private

    def resource_params
      params.require(:resource).permit(:name, :email, :position, :location, :company, :website, :category_id, :photo)
    end
     
end
