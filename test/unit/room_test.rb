require 'test_helper'

describe "Room", ActiveSupport::TestCase do
  # Replace this with your real tests.
  it "should be destroyable if there are 0 presence" do
    room = Room.new
    room.presence.size.should == 0
    room.should.be.destroyable
  end
end
