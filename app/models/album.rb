class Album < ApplicationRecord
  validates :title, :band_id, :year, presence: true
  validates :studio_album, inclusion: { in: [true, false] }

  belongs_to :band,
    class_name: 'Band',
    foreign_key: :band_id,
    primary_key: :id

  has_many :tracks, dependent: :destroy,
    class_name: 'Track',
    foreign_key: :album_id,
    primary_key: :id
end