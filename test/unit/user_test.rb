require File.dirname(__FILE__) + '/../test_helper'

describe "User", ActiveSupport::TestCase do
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.
  include AuthenticatedTestHelper
  fixtures :users

  it "should create user" do
    assert_difference 'User.count' do
      user = create_user
      user.new_record?, "#{user.errors.full_messages.to_sentence}".should.not == true
    end
  end

  it "should require login" do
    assert_no_difference 'User.count' do
      u = create_user(:login => nil)
      u.errors.on(:login).should.not == nil
    end
  end

  it "should require password" do
    assert_no_difference 'User.count' do
      u = create_user(:password => nil)
      u.errors.on(:password).should.not == nil
    end
  end

  it "should require password confirmation" do
    assert_no_difference 'User.count' do
      u = create_user(:password_confirmation => nil)
      u.errors.on(:password_confirmation).should.not == nil
    end
  end

  it "should require email" do
    assert_no_difference 'User.count' do
      u = create_user(:email => nil)
      u.errors.on(:email).should.not == nil
    end
  end

  it "should reset password" do
    users(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal users(:quentin), User.authenticate('quentin', 'new password')
  end

  it "should not rehash password" do
    users(:quentin).update_attributes(:login => 'quentin2')
    assert_equal users(:quentin), User.authenticate('quentin2', 'monkey')
  end

  it "should authenticate user" do
    assert_equal users(:quentin), User.authenticate('quentin', 'monkey')
  end

  it "should set remember token" do
    users(:quentin).remember_me
    users(:quentin).remember_token.should.not == nil
    users(:quentin).remember_token_expires_at.should.not == nil
  end

  it "should unset remember token" do
    users(:quentin).remember_me
    users(:quentin).remember_token.should.not == nil
    users(:quentin).forget_me
    users(:quentin).remember_token.should == nil
  end

  it "should remember me for one week" do
    before = 1.week.from_now.utc
    users(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    users(:quentin).remember_token.should.not == nil
    users(:quentin).remember_token_expires_at.should.not == nil
    users(:quentin).remember_token_expires_at.between?(before, after).should.not == nil
  end

  it "should remember me until one week" do
    time = 1.week.from_now.utc
    users(:quentin).remember_me_until time
    users(:quentin).remember_token.should.not == nil
    users(:quentin).remember_token_expires_at.should.not == nil
    time.should == users(:quentin).remember_token_expires_at
  end

  it "should remember me default two weeks" do
    before = 2.weeks.from_now.utc
    users(:quentin).remember_me
    after = 2.weeks.from_now.utc
    users(:quentin).remember_token.should.not == nil
    users(:quentin).remember_token_expires_at.should.not == nil
    users(:quentin).remember_token_expires_at.between?(before, after).should.not == nil
  end

protected
  def create_user(options = {})
    record = User.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69' }.merge(options))
    record.save
    record
  end
end
