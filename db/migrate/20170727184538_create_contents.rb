class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :kind
      t.string :value
      t.integer :page_id

      t.timestamps
    end
    add_index :contents, :page_id
  end
end
