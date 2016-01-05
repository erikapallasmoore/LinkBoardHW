class Post < ActiveRecord::Base
  belongs_to :user
  	validates :title,
	presence: true, length: { minimum: 10 maximum: 100 }

	validates :link,
	presence: true,
	format: { with: URI::HTTP }
	

	validates_presence_of :password, on: :create

	has_secure_password

	

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
		# user if user.authenticate(password)

	end
end
