class CreateSimons < ActiveRecord::Migration[7.0]
  def change
    create_table :simons do |t|
      t.integer :max_n
      t.text :result

      t.timestamps
    end
  end
end
