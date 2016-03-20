class CategoriesController < ApplicationController

  before_action :set_category, only: [:show,:destroy,:edit,:update]

  def show
  end

  def new
    @category = Category.new
  end
  def edit
    if @category.user != current_user
      redirect_to master_categories_url, notice: 'You cannot edit a default category.'
    end
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created'
    else
      render :new
    end
  end

  def update
    if @category.user != current_user
      if @category.update(master_category_params)
        redirect_to @category, notice: 'Category was successfully updated.'
      else
        render :new
      end
    else
      redirect_to master_categories_url, notice: 'You cannot edit a default category.'
    end
  end

  def destroy
    if @category.user != current_user
      @category.destroy
      redirect_to master_categories_url, notice: 'Master category was successfully destroyed.'
    else
      redirect_to master_categories_url, notice: 'You cannot destroy a default categroy'
    end
  end

  private
    def category_params
      params.require(:category).permit(:name,:master_category_id)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
