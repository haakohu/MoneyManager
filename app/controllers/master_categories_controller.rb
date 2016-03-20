class MasterCategoriesController < ApplicationController
  before_action :set_master_category, only: [:show,:edit,:destroy,:update]
  def index
    @master_categories = MasterCategory.get_master_categories(current_user)
  end

  def new
    @master_category = MasterCategory.new
  end

  def show
  end

  def edit
    if @master_category.user != current_user
      redirect_to master_categories_url, notice: 'You cannot edit a default master category.'
    end
  end

  def destroy
    if @master_category.user != current_user
      @master_category.destroy
      redirect_to master_categories_url, notice: 'Master category was successfully destroyed.'
    else
      redirect_to master_categories_url, notice: 'You cannot destroy a default master categroy'
    end
  end

  def update
    if @master_category.user != current_user
      if @master_category.update(master_category_params)
        redirect_to @master_category, notice: 'Master category was successfully updated.'
      else
        render :new
      end
    else
      redirect_to master_categories_url, notice: 'You cannot edit a default master category.'
    end
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
