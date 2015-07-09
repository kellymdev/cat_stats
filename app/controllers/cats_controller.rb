class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat, notice: "Cat was successfully added"
    else
      render :new, status: 400
    end
  end

  def destroy
    @cat = Cat.find_by_id(params[:id])
    @cat.destroy
    redirect_to cats_path, notice: "#{@cat.pet_name} was successfully deleted"
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
    if @cat
      render :edit
    else
      redirect_to cats_path
    end
  end

  def update
    @cat = Cat.find_by_id(params[:id])
    if @cat.update(cat_params)
      redirect_to @cat, notice: "Cat was successfully updated"
    else
      render :edit, status: 400
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:pet_name, :registered_name, :registration_number, :date_of_birth, :date_of_death, :breed_id, :coat_colour_id, :title_id, :image_url, :gender_id)
  end
end