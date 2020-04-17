class AddColumnComplete < ActiveRecord::Migration[5.2]
  def change
    change_table :tasks do |t|
      t.column :complete, :boolean
    end
  end
end