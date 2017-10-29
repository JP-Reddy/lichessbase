class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :player
  # after_create :create_or_find_player
  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  
  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  } # etc.

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end

 #    conditions[:email].downcase! if conditions[:email]
	# where(conditions.to_h).first

  end
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(name: data["name"], email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end

  # def create_or_find_player
  #   player=Player.find_by(pname: self.username)
  #   if player.nil?
  #     liplayer=JSON.parse(HTTParty.get("https://lichess.org/api/user/#{self.username}").body)
  #     BRating=(liplayer['perfs']['bullet']['rating'].to_i+liplayer['perfs']['blitz']['rating'])/2
  #     player=Player.create(pname: self.username, country: liplayer['profile']['country'], 
  #       BRating: BRating, SRating: liplayer['perfs']['classical']['rating'])
  #   end
  #   self.player=player
  # end

end
