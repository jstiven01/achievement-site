class AddFeaturedToAchievement < ActiveRecord::Migration[5.2]
  def change
    add_column :achievements, :featured, :boolean
  end
end
