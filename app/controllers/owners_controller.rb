class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end
  def new
    @owner = Owner.new
  end
  def create
    owner = Owner.create(owner_params)
    if owner.save
      redirect_to owners_path
      flash[:notice] = "Succesfully created!"
    else
      flash[:error] = owner.errors.messages
      redirect_to owners_path
    end
  end
  def edit
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
    render :edit
  end
  def update
    owner_id=params[:id]
    @owner=Owner.find_by(id: owner_id)
    @owner.update(owner_params)
    redirect_to owner_path(@owner)
  end
  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
    @pets=@owner.pets
  end
  def destroy
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
    @owner.destroy
    redirect_to owners_path
  end
  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end
end
