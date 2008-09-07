class Room < ActiveRecord::Base
  has_many :messages
  has_many :presence
  has_many :users, :through => :presence

  def destroyable?
    ! presence.any?
  end
end
