class ChangeName < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :username, :email
      t.column :uid, :string
      t.column :image, :string
      t.column :name, :string
    end
  end
end