require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test 'the truth' do
  #   assert true
  # end

  def setup
    @user = User.new(name: 'Test User', email: 'user@example.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '    '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '    '
    assert_not @user.valid?
  end
  test 'name lenght test' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end
  test 'email lenght test' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end

  test 'email format test' do
    @user.email = 'coucou@cestmoi.com'
    assert @user.valid?
  end

  test 'not valid emails' do
    unvalid_add = %w[romu@gmail,com romuald romromrom@r@r, romuald.sox,
                     test@test+test.com test@test..com]
    unvalid_add.each do |mel|
      @user.email = mel
      assert_not @user.valid?, '#{unvalid_add} is valid but should not'
    end
  end
  test 'email uniqueness' do
    dupli_user = @user.dup
    dupli_user.email = @user.email.upcase
    @user.save
    assert_not dupli_user.valid?
  end

  test 'email is written in downcase' do
    test_email = 'YouPlaBop@geniALL.COm'
    @user.email = test_email
    @user.save
    assert_equal test_email.downcase, @user.reload.email
  end
end
