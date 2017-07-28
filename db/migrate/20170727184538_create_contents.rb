class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :kind
      t.string :value
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
