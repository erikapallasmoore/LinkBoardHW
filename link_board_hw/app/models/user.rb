class User < ActiveRecord::Base
	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false}

	validates :name, 
	presence: true, length: { maximum: 20 }

	validates_presence_of :password, on: :create

	has_secure_password

	has_many :pet

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
		# user if user.authenticate(password)

	end
end
