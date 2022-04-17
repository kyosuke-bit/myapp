class ChangeDataPrefecturesToProfiles < ActiveRecord::Migration[6.0]
  def change
    change_column :profiles, :prefectures, :integer
  end
end
