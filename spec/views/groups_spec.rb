require 'spec_helper'

RSpec.describe 'Groups Views', type: :feature do
  before(:each) do
    u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
    pic_path = 'app/assets/images/actor_avatar_people_person_profile_user_voice_icon_123373.png'
    u1.avatar = Pathname.new(Rails.root.join(pic_path)).open
    u1.save
    g1 = Group.new(name: 'testgroup 1', icon: 'fa-handshake', user_id: 1)
    g1.save
    visit '/users/sign_in'
    fill_in 'Email', with: 'test1@s.com'
    fill_in 'Password', with: '123456'
    click_button('Sign in')
    expect(page).to have_content('Test1')
  end

  scenario 'add new categorie' do
    find('a', text: 'Categories').click
    find(:xpath, "//a[@href='/groups/new']").click
    fill_in 'Name', with: 'test'
    choose(option: 'fa-glass-cheers')
    click_button('Create Group')
    expect(page).to have_content('Categories')
  end
end
