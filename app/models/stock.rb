class Stock < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  validates :user_id,
    uniqueness: {
      message: "すでにStock済みです",
      scope: [:item_id]
  }
end
