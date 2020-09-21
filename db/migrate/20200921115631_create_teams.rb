class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :tournament, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
