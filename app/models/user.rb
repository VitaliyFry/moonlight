class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_one :player

  validates :name, presence: true, uniqueness: true

  after_create do
    default_avatar = Avatar.first

    Player.create(user_id: self.id, current_hp: 20, gold: 1500, name: self.name, avatar_id: default_avatar.id)
  end
end
