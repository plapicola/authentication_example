class User < ApplicationRecord

  validates :name, {
   presence: true,
   length: {minimum: 1}
  }

  validates :password,
    presence: true,
    length: {minimum: 1}

  validates :email,
    presence: true,
    length: {minimum: 1},
    uniqueness: true

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      return user
    else
      nil
    end
  end
end
