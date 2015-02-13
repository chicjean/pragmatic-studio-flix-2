class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  has_secure_password

  before_save :format_username
  before_save :format_email

  validates :name, presence: true

  validates :username, presence: true, 
  							format: /\A[A-Z0-9]+\z/i, 
  							uniqueness: {case_sensitive: false }, 
  							length: { minimum: 8 }

  validates :email, presence: true, 
  							format: /\A\S+@\S+\z/,
  							uniqueness: { case_sensitive: false }, 
  							length: { minimum: 10, allow_blank: true }
  							#By setting the allow_blank option to true, the length validation won't run if the password field is blank.  That's important because a password isn't required when a user updates his name and/or email. 
	
  scope :by_name, -> { order(:name) }
  scope :not_admins, -> { by_name.where(admin: false) }

	def gravatar_id
	  Digest::MD5::hexdigest(email.downcase)
	end
	#To access a user's profile image, we need to generate an MD5 hash of the user's email address. 
	#That method simply returns a string that represents the hashed value for the email address. For every unique email address, the method will return a consistent and unique hashed value. Think of it as your unique Gravatar id, which is why we named the method as such.

  def self.authenticate(email_or_username, password)
    user = User.find_by(email: email_or_username) || User.find_by(username: email_or_username)
    
    user && user.authenticate(password)
  end

  def format_username
    self.username = username.downcase
  end

  def format_email
    self.email = email.downcase
  end

end
