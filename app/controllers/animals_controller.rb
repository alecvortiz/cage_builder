class AnimalsController < ApplicationController
	def create
    @cage = Cage.find(params[:cage_id])
    @animal = @cage.animals.create(animal_params)
    redirect_to cage_path(@cage), notice: "Mouse successfully created."
  end
 
     def destroy
      @cage = current_user.cages.find(params[:cage_id])
      @animal = @cage.animals.find(params[:id])
      @animal.destroy
      redirect_to cage_path(@cage)
    end

    def edit 
     @cage = current_user.cages.find(params[:cage_id])
     @animal = @cage.animals.find(params[:id])
     
    end

   def update
      @cage = current_user.cages.find(params[:cage_id])
      @animal = @cage.animals.find(params[:id])

      if @animal.update(animal_params)
          redirect_to cage_path(@cage)
        else 
        render 'animals/edit'
      end
   end

  private
    def animal_params
      params.require(:animal).permit(:birthday, :gender, :genotype, :tag)
    end
end
