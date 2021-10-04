class DropUserStatistics < ActiveRecord::Migration[6.1]
  def change
    drop_table :user_statistcs
  end
end
