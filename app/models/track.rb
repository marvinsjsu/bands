# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  album_id   :integer          not null
#  band_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  lyrics     :text
#  track_type :string(255)
#

class Track < ActiveRecord::Base
  belongs_to :album
  belongs_to :band

  validates :name, :album_id, :band_id, presence: true

end
