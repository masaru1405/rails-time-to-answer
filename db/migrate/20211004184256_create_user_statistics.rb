class CreateUserStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :user_statistics do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :correct_questions, default: 0
      t.integer :incorrect_questions, default: 0

      t.timestamps
    end
  end
end
