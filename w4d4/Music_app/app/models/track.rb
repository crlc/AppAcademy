# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  song       :string           not null
#  side       :string           not null
#  lyrics     :string           not null
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :song, :side, :lyrics, :album_id, presence: true
  belongs_to :album
  has_many :notes, dependent: :destroy
end
