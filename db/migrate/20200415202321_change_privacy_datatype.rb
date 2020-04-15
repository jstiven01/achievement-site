class ChangePrivacyDatatype < ActiveRecord::Migration[5.2]
  def change
    change_column :achievements, :privacy, :integer
  end
end
