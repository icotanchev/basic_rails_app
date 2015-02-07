class CreateDefaults < ActiveRecord::Migration
  def change
    create_table :defaults do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
