class InteractionsController < ApplicationController
	before_action :find_groop

	def create
		@interaction = @groop.interactions.build(interaction_params)
		respond_to do |f|
			if @interaction.save
				# @groops = current_user.groops
				f.html { redirect_to groop_path(@groop) }
				f.js
			else
				@errors = @interaction.errors.full_messages.to_sentence
				f.html { redirect_to "/#groop-#{@groop.id}" }
				f.js
			end
		end
	end

	def destroy
		@interaction = Interaction.find(params[:id])
		@interaction.destroy
		redirect_back(fallback_location: root_path)
	end

	private

		def interaction_params
			params.require(:interaction).permit(:type_of_interaction, :date)
		end

		def find_groop
			@groop = Groop.find(params[:groop_id])
		end
end
