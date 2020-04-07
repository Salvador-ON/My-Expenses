require 'rails_helper'

RSpec.describe User, type: :model do
  context 'test creation valid user' do
    it 'return true if is created a valid user' do
      u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
      pic_path = 'app/assets/images/actor_avatar_people_person_profile_user_voice_icon_123373.png'
      u1.avatar = Pathname.new(Rails.root.join(pic_path)).open
      u1.save
      expect(u1.valid?).to eq(true)
    end

    it 'return false if is created invalid user with duplicate name' do
      u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
      pic_path = 'app/assets/images/actor_avatar_people_person_profile_user_voice_icon_123373.png'
      u1.avatar = Pathname.new(Rails.root.join(pic_path)).open
      u1.save
      u1 = User.new({ email: 'test1@as.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
      pic_path = 'app/assets/images/actor_avatar_people_person_profile_user_voice_icon_123373.png'
      u1.avatar = Pathname.new(Rails.root.join(pic_path)).open
      expect(u1.valid?).to eq(false)
    end

    it 'create invalid user with out avatar' do
      u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
      expect(u1.valid?).to eq(false)
    end

    it 'create invalid user with duplicate email' do
      u1 = User.new({ email: 'test1@s.com', name: 'Test1', password: '123456', password_confirmation: '123456' })
      pic_path = 'app/assets/images/actor_avatar_people_person_profile_user_voice_icon_123373.png'
      u1.avatar = Pathname.new(Rails.root.join(pic_path)).open
      u1.save
      u1 = User.new({ email: 'test1@s.com', name: 'Test1a', password: '123456', password_confirmation: '123456' })
      u1.avatar = Pathname.new(Rails.root.join(pic_path)).open
      expect(u1.valid?).to eq(false)
    end
  end
end
