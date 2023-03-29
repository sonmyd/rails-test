class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :role
      t.references :company, foreign_keys: true
      t.timestamps
    end
  end
end
