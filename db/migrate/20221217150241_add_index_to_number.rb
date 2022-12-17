class AddIndexToNumber < ActiveRecord::Migration[7.0]
  def change
    add_index :results, :number, unique: true
  end
end
