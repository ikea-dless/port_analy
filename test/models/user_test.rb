require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'ユーザー登録できている' do
    assert @user.valid?
  end
end
