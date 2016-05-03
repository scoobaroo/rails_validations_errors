class PetsController < ApplicationController
  def index
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
    @pets = @owner.pets
    render :index
  end
end
