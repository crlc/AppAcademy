# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  recorded   :string           not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :title, :recorded, :band_id, presence: true
  belongs_to :band
  has_many :tracks, dependent: :destroy
end
