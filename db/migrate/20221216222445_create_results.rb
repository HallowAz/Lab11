class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.integer :number
      t.text :arr

      t.timestamps
    end
  end
end
