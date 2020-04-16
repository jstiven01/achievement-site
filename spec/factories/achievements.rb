FactoryBot.define do
    factory :achievement do
      sequence(:title) { |n| "Achievement #{n}"}
      description {"Description..."}
      privacy {Achievement.privacies[:private_access]}
      featured {false}
      cover_image {"some_image.png"}
      association :user
    end
end