class RemoveLowerEndAndUpperEndFromCultureTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :culture_types, :lower_end
    remove_column :culture_types, :upper_end
  end
end
