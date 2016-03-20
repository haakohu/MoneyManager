class MasterCategoriesController < ApplicationController
  before_action :set_master_category, only: [:show]
  def index
    @master_categories = MasterCategory.all.find_all{|t| t.user == current_user}
  end

  def new
    @master_category = MasterCategory.new
  end

  def show
  end

  def create
    @master_category = MasterCategory.new(master_category_params)
    @master_category.user = current_user
    if @master_category.save
      redirect_to master_category_path(@master_category), notice: 'Master category was sucessfully created.'
    else
      render :new
    end
  end

  private
    def master_category_params
      params.require(:master_category).permit(:name)
    end

    def set_master_category
      @master_category = MasterCategory.find(params[:id])
    end

end
