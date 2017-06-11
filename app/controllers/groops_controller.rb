class GroopsController < ApplicationController
	before_action :find_groop, only: [:edit, :update, :show, :destroy]

  def index
  	set_index_variables
  	@groop  = Groop.new
  	@groop.friends.build
  end

  def show
  end

  def create
  	@groop = current_user.groops.build(groop_attributes)

  	if @groop.save
  		puts "\n\n\n#{@groop.inspect}\n\n"
  		redirect_back(fallback_location: root_path)
  	else
  		puts "\n\n\n#{@groop.inspect}\nERROR! #{@groop.errors.full_messages}\n\n"
  		# redirect_back(fallback_location: root_path)
  		set_index_variables
  		render :index
  	end
  end

  def edit
  end

  def update
  	if @groop.update(groop_attributes)
  		puts "\n\n\n#{@groop.inspect}\n\n"
  		redirect_to "/#groop-#{@groop.id}"
  	else
  		puts "\n\n\n#{@groop.inspect}\nERROR! #{@groop.errors.full_messages}\n\n"
  		render :edit
  	end
  end

  def destroy
  	@groop.destroy
  	redirect_to root_path
  end

  private

  	def find_groop
  		@groop = Groop.find(params[:id])
  	end

  	def set_index_variables
  		@groops = current_user.groops
  	end

  	def groop_attributes
  		params.require(:groop).permit(:nickname, friends_attributes: [:id, :name, :_destroy])
  	end
end
