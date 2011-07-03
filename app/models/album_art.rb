class AlbumArt < ActiveRecord::Base
  attr_accessible :small, :medium, :large, :extralarge, :mega

  belongs_to :album
end

# == Schema Information
#
# Table name: album_arts
#
#  id         :integer         not null, primary key
#  album_id   :integer
#  small      :string(255)
#  medium     :string(255)
#  large      :string(255)
#  extralarge :string(255)
#  mega       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

