class User < ActiveRecord::Base
  include BCrypt

  has_many :digs,     foreign_key: :owner_id, dependent: :destroy
  has_many :comments, foreign_key: :owner_id, dependent: :destroy
  has_many :votes,    foreign_key: :voter_id, dependent: :destroy

  validates :email, presence: true, uniqueness: true, email: true

  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :password, presence: true, on: :create

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
