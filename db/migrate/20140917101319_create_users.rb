class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :role

      t.timestamps
    end
  end
end
