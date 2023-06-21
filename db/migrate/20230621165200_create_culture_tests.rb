class CreateCultureTests < ActiveRecord::Migration[7.0]
  def change
    create_table :culture_tests do |t|
      t.string :test_type
      t.integer :respondent_id
      t.integer :answer_one
      t.integer :answer_two
      t.integer :answer_three
      t.integer :answer_four
      t.integer :answer_five
      t.integer :answer_six
      t.integer :answer_seven
      t.integer :answer_eight
      t.integer :result
      t.datetime :completed_at

      t.timestamps
    end
  end
end
