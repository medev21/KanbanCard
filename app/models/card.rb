class Card < ActiveRecord::Base
  belongs_to :board
  belongs_to :user

  belongs_to :list
end
