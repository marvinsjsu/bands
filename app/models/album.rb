# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  band_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  production :string(255)      not null
#

class Album < ActiveRecord::Base
  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :name, :band_id, presence: true

end
