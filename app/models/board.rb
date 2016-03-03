class Board < ActiveRecord::Base
  belongs_to :user
  has_many :lists, dependent: :destroy
  has_many :cards, dependent: :destroy
end
