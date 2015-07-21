class CagesController < ApplicationController

	def all
		@cages = Cage.all
		if params[:q]
			@users = User.where("email LIKE ?", "%#{params[:q]}%")
		else
		   @users = User.all
		end
	end

	def index
		if params[:q]
			@cages = current_user.cages.where("line LIKE ? or cage_type LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
		else
		   @cages = current_user.cages
		end
	 end

	 def personal
	 	# redirect_to all_path, notice: "You need to be an admin to view another researcher's cages." unless current_user && current_user.admin?
	 	@users = User.all
	 	@cages = Cage.all
	 end

	 def show
	 	@cage = Cage.find params[:id]
	 end

	 def new 
	 	@user = current_user
	 	@cage = Cage.new
	 end

	 def create
	 	@cage = current_user.cages.create(cages_params)
	 	if @cage.save
	 		redirect_to cages_path, notice: "Cage successfully created."
	 	else
	 		render 'new'
	 	end
	 	
	 end

	 def edit 
	 	@cage = current_user.cages.find params[:id]
	 end

	 def update
 	    @cage = current_user.cages.find(params[:id])

  		if @cage.update(cages_params)
   	    	redirect_to cages_path
   	    else 
   			render 'edit'
   		end
	 end

	 def destroy
	 	cage = current_user.cages.find params[:id]
	 	cage.destroy
	 	redirect_to "/", notice: "Cage successfully deleted."
	 end

	 private 
	 	def cages_params
			params.require(:cage).permit(:num_mice, :line, :pups, :cage_type, :num_litters)
	 	end
end
