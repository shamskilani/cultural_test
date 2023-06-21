class CreateCultureTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :culture_types do |t|
      t.string :name
      t.integer :lower_end
      t.integer :upper_end

      t.timestamps
    end
  end
end
