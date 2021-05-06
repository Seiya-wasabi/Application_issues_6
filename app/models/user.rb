class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :relationships, class_name: "follower", foreign_key: "○○_id", dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  
  
  # def follow(other_user)
  #   unless self == other_user
  #     self.relationships.find_or_create_by(follow_id: other_user.id)
  #   end
  # end

  # def unfollow(other_user)
  #   relationship = self.relationships.find_by(follow_id: other_user.id)
  #   relationship.destroy if relationship
  # end

  # def following?(other_user)
  #   self.followings.include?(other_user)
  # end
  # ユーザーをフォローする
  def follow(user)
    follower.create(followed_id: user.id)
  end
  
  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end
  
  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  # def follow(other_user)
  #   unless self == other_user
  #     follower.create(followed_id: other_user.id)
  #   end
  # end

  # def unfollow(other_user)
  #   follower.find_by(followed_id: other_user.id).destroy
  # end

  # def following?(other_user)
  #   followings.include?(other_user)
  # end
  # belongs_to :books
  attachment :profile_image, destroy: false
  # validates :introduction, length: {maximum: 50}, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
end
