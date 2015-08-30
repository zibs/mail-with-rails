require 'rails_helper'

RSpec.describe Reader, :type => :model do
  	
	subject{create(:reader)}

  	it "validates" do 
  		expect(subject).to be_valid
  	end


end
