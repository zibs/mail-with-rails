class ReadersController < ApplicationController
	def new
		@reader = Reader.new
	end

	def create
		@reader = Reader.new(reader_params)
		 if @reader.save
		 	flash[:success] = "You did it!"
		 	PoetryMailer.daily_poetry(@reader).deliver_now
		 	redirect_to root_url
		 else
		 	render 'new'
		 end
	end


		private 
		def reader_params
			params.require(:reader).permit(:name, :email)
		end
end
