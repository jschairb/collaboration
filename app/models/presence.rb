class Presence < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  def touch
    updated_at_will_change!
    save
  end

  def self.expire
    delete_all "updated_at < '#{self.expiration_time}'"
  end

  def self.expiration_time
    (Time.now.getutc - 1.minutes).to_s(:db)
  end
end
