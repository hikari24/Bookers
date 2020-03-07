class Book < ApplicationRecord
	validates :title, presence: true, on: :create
	validates :body, presence: true, on: :create
end
