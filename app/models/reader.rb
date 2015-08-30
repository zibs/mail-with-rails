class Reader < ActiveRecord::Base
	
	validates :name,  presence: true, length: { maximum:50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum:255 },
					  format: { with: VALID_EMAIL_REGEX },
					  uniqueness: { case_sensitive: false }

	before_save :downcase_email












	  private

        def downcase_email
          self.email = email.downcase
        end

end

