class AddTotalAverageRatingToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :total_average, :integer, default: 0
  end
end
