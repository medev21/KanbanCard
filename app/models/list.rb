class List < ActiveRecord::Base
  belongs_to :board
  belongs_to :user

  has_many :cards, dependent: :destroy
end
