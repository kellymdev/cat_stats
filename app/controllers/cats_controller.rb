class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat, notice: "Cat was successfully added"
    else
      render :new
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:pet_name, :registered_name, :registration_number, :date_of_birth, :date_of_death, :breed, :coat_colour, :title)
  end
end