class Location < ApplicationRecord
  belongs_to :picture
  belongs_to :character

  attr_accessor :coords

  validates :x_coord, presence: true
  validates :y_coord, presence: true
  validate :unique_local_coords

  def coords
    [x_coord, y_coord]
  end

  def coords=(array)
    update(x_coord: array[0], y_coord: array[1])
  end

  private

    def unique_local_coords
      if other_character = picture.characters.where.not(id: id).where('x_coord = ?', x_coord).where('x_coord = ?', x_coord).first
        errors.add(:coords, "are already taken")
      end
    end

end
