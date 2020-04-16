require 'rails_helper'

feature 'interface achievement' do
    scenario 'index achievements' do
        achievements = FactoryBot.create_list(:achievement, 3)
        visit('/achievements')

        expect(page).to have_content(achievements[0].title)
        expect(page).to have_content(achievements[1].title)
    end

    scenario 'Edit Achievemente' do
        achievements = FactoryBot.create_list(:achievement, 3)
    end

    scenario 'New post from guest user' do
        visit('/')
        click_on('New Achievement')        
        expect(page.current_path).to eq(new_user_session_path) 
    end
end