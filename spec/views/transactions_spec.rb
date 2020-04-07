require 'spec_helper'

RSpec.describe 'Transaction Views', type: :feature do
  before(:each) do
    u1=User.new({email:'test1@s.com', name:'Test1', password:'123456', password_confirmation:'123456'})
    u1.avatar=Pathname.new(Rails.root.join("app/assets/images/actor_avatar_people_person_profile_user_voice_icon_123373.png")).open
    u1.save
    g1=Group.new(name:'testgroup 1', icon:'fa-handshake', user_id:1)
    g1.save
    visit '/users/sign_in'
    fill_in 'Email', with: 'test1@s.com'
    fill_in 'Password', with: '123456'
    click_button('Sign in')
    expect(page).to have_content('Test1')
  end

  scenario 'visit my expenses' do
    find('a', text: 'My expenses').click
    expect(page).to have_content('Expenses')
  end

  scenario 'visit none categorised expenses' do
    find('a', text: 'None categorised expenses').click
    expect(page).to have_content('None Categorised')
  end

  scenario 'visit categories' do
    find('a', text: 'Categories').click
    expect(page).to have_content('Categories')
  end

  scenario 'visit members expenses' do
    find('a', text: 'Members expenses').click
    expect(page).to have_content('Members Expenses')
  end

  scenario 'create new categorise expense' do
    find('a', text: 'My expenses').click
    find(:xpath, "//a[@href='/transactions/new']").click
    fill_in 'Name', with: 'test'
    fill_in 'Amount', with: '123'
    find('#transaction_group_id').find(:xpath, 'option[2]').select_option
    click_button('Create Transaction')
    expect(page).to have_content('Expenses')
  end

  scenario 'create new none categorise expense' do
    find('a', text: 'None categorised expenses').click
    find(:xpath, "//a[@href='/transactions/new']").click
    fill_in 'Name', with: 'test'
    fill_in 'Amount', with: '123'
    click_button('Create Transaction')
    expect(page).to have_content('None Categorised')
  end

  
end
