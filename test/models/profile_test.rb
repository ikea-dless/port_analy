require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  def setup
    @profile = profiles(:ikeda)
    @non_image_profile = profiles(:non_image_ikeda)
  end

  test 'プロフィールが存在している' do
    assert @profile.valid?
    assert @non_image_profile.valid?
  end

  test '名前がnullでない' do
    @profile.name = ''
    assert_not @profile.valid?
  end

  test '名前が50文字以下である' do
    @profile.name = 'a' * 51
    assert_not @profile.valid?
  end
end
