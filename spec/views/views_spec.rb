require 'spec_helper'

RSpec.describe 'Sing in Views', type: :feature do
  before(:each) do
    u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
    pic_path = 'app/assets/images/actor_avatar_people_person_profile_user_voice_icon_123373.png'
    u1.avatar = Pathname.new(Rails.root.join(pic_path)).open
    u1.save
  end

  scenario 'sign in redirect to profile page' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'test1@s.com'
    fill_in 'Password', with: '123456'
    click_button('Sign in')
    expect(page).to have_content('Test1')
  end

  scenario 'log out redirect to root' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'test1@s.com'
    fill_in 'Password', with: '123456'
    click_button('Sign in')
    find('a', text: 'Log Out').click
    expect(page).to have_content('Welcome To My Expenses!')
  end
end
