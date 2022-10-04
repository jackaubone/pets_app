class PetsController < ApplicationController
  def index
    @pets = Pet.all
    render template: "pets/index"
  end
  def show
    @pet = Pet.find_by(id: params[:id])
    render template: "pets/show"
  end

  def new
    @pet = Pet.new
    render template: "pets/new"
  end
  def create
    @pet = Pet.new(
      name: params[:pet][:name],
      breed: params[:pet][:breed],
      image: params[:pet][:image]
    )
    if @pet.save
      redirect_to "/pets"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @pet = Pet.find_by(id: params[:id])
    render template: "/pets/edit"
  end
  def update
    @pet = Pet.find_by(id: params[:id]) 
    @pet.name = params[:pet][:name]
    @pet.breed = params[:pet][:breed] 
    @pet.image = params[:pet][:image] 
    if @pet.save 
      redirect_to "/pets"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @pet = Pet.find_by(id: params[:id])
    @pet.destroy
    redirect_to "/pets", status: :see_other
  end

end
