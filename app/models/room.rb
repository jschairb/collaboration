class Room < ActiveRecord::Base
  has_many :messages
  has_many :presence
  has_many :users, :through => :presence
  has_one :last_message, :class_name => "Message", 
                         :order => "messages.created_at DESC"

  def destroyable?
    ! presence.any?
  end
end
