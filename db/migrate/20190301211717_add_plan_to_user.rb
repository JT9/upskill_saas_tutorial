class AddPlanToUser < ActiveRecord::Migration[5.0]
  def change
    #link plan to users in table
    add_column :users, :plan_id, :integer
  end
end
