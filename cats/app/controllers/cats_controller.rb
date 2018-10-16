class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    # optional if you want the variable to be nil
    # @cat = Cat.find_by(id: params[:id])
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    cat = Cat.find(params[:id])
    if cat.update(cat_params)
      redirect_to cat_url(cat)
    else
      flash[:errors] = cat.errors.full_messages
      redirect_to edit_cat_url(cat)
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
