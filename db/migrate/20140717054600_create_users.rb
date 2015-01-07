class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :real_name
      t.date :birth_date
      t.string :position

      t.timestamps
    end
  end
end
