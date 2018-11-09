class CreatePowers < ActiveRecord::Migration[5.0]
  def change
    create_table :powers do |t|
      t.string :name
      t.string :description
      t.string :img_url
      t.timestamps
    end
  end
end
