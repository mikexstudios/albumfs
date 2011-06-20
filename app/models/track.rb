class Track < ActiveRecord::Base
end

# == Schema Information
#
# Table name: tracks
#
#  id         :integer         not null, primary key
#  album_id   :integer
#  title      :string(255)
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

