class PeopleController < ApplicationController
  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    # Shows a pre filled form to edit the page
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to person_path(@person)
      # successful update
    else
      # failed update
      render :edit
    end
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      # success
      redirect_to persons_path
    else
      # fail
      render :new
    end
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to persons_path
  end


  private

  # Strong Params
  def person_params
    params.require(:person).permit(:first_name, :last_name, :age, :career, :single, :movie_quote)
  end
  end
