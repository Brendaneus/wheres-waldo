class Picture < ApplicationRecord
  belongs_to :album, optional: true
  has_many :locations, dependent: :destroy
  has_many :characters, through: :locations
  has_many :scores, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 32 }

end
