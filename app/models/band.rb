# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Band < ActiveRecord::Base
  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums, source: :tracks

  validates :name, presence: true, uniqueness: true
end
