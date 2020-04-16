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
end