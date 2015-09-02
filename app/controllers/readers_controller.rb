class ReadersController < ApplicationController
	def new
		@reader = Reader.new
	end

	def create
		@reader = Reader.new(reader_params)
		 if @reader.save
		 	flash[:success] = "Après aujourd'hui le déluge!"
		 	PoetryMailer.welcome_email(@reader).deliver_later
		 	redirect_to :milton
		 else
		 	render :new
		 end
	end

	def milton
	end

		private 
		def reader_params
			params.require(:reader).permit(:name, :email)
		end
end
