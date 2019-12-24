class Score < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  has_and_belongs_to_many :characters
end
