class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :plan_type
      t.date :start
      t.decimal :length
      t.string :unit

      t.timestamps
    end
  end
end
