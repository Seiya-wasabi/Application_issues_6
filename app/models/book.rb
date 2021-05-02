class Book < ApplicationRecord
	# has_many :user
	belongs_to :user
	has_many :book_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
