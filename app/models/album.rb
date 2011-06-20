class Album < ActiveRecord::Base
end

# == Schema Information
#
# Table name: albums
#
#  id           :integer         not null, primary key
#  artist_id    :integer
#  name         :string(255)
#  release_date :date
#  created_at   :datetime
#  updated_at   :datetime
#

