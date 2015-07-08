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
    p params
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat, notice: "Cat was successfully added"
    else
      render :new, status: 400
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:pet_name, :registered_name, :registration_number, :date_of_birth, :date_of_death, :breed_id, :coat_colour_id, :title_id)
  end
end