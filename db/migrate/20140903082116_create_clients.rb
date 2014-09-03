class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :company
      t.string :owner
      t.string :name
      t.integer :id_number

      t.timestamps
    end
  end
end
