class AnnotationsController < ApplicationController
	before_action :find_game
	before_action :authenticate_user!, only: [:edit,:update,:destroy,:create]
	before_action :find_annotation, only: [:edit,:update,:destroy]
	
	def new
		@annotation=Annotation.new
		respond_to do |format|
			format.html
			format.js 
		end
	end

	def create
		@annotation=Annotation.new(annotation_params)
		@annotation.game_id=@game.id
		@annotation.user_id=current_user.id
		if @annotation.save 
		respond_to do |format|
			format.html {redirect_to game_path(@game)}
			format.js 
		end
			
		else
			render 'new'
		end

	end


	def edit 
	end

	def update
		@annotation.update(annotation_params)
		if @annotation.save
			redirect_to game_path(@game)
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def annotation_params
		params.require(:annotation).permit(:id,:annotation)
	end

	def find_game
		@game=Game.find(params[:game_id])
	end

	def find_annotation
		@annotation=Annotation.find(params[:id])
	end


end
