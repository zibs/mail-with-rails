class ReadersController < ApplicationController
	def new
		@reader = Reader.new
	end

	def create
		@reader = Reader.new(reader_params)
		 if @reader.save
		 	flash[:success] = "You did it!"
		 	redirect_to root_url
		 else
			flash[:warning] = "You didn't do it yet!"
		 	redirect_to root_url
		 end
	end


		private 
		def reader_params
			params.require(:reader).permit(:name, :email)
		end
end
