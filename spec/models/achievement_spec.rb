require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validations model' do
    it 'requires title' do
      achievement = Achievement.new(title: '')
      expect(achievement.valid?).to be_falsy
      expect(achievement.errors[:title]).not_to be_empty
    end

    it 'requires title to be unique for one user' do
      user = FactoryBot.create(:user)
      first_achv = FactoryBot.create(:achievement, title:'ss', user: user)
      new_ach = Achievement.new(title: 'ss', user: user)

      expect(new_ach.valid?).to be_falsy
    end

    it 'allows different users to have achievements with identical titles' do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      first_achv = FactoryBot.create(:achievement, title:'ss', user: user1)
      new_ach = Achievement.new(title: 'ss', user: user2)
      expect(new_ach.valid?).to be_truthy
    end
  end

  describe 'associations' do
    it 'belongs to user'do
      achievement = Achievement.new(title:'Some title', user:nil)
      expect(achievement.valid?).to be_falsy
    end

    it 'has belongs_to user association' do
      #1 approach
      user = FactoryBot.create(:user)
      achievement =FactoryBot.create(:achievement, user: user)
      expect(achievement.user).to eq(user)

      #2 approach
      user_asoc = Achievement.reflect_on_association(:user)
      expect(user_asoc.macro).to eq(:belongs_to)
    end
  end

  describe 'validations model shoulda' do
    it { should validate_presence_of(:title)}
    it { should validate_uniqueness_of(:title).scoped_to(:user_id).with_message("you can't have two achievements with the same title")}
  end

  describe 'associations model shoulda' do
    it { should belong_to(:user)}
  end
end
