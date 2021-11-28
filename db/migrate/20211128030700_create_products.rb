class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :thumb_image
      t.text :content
      t.text :link
      t.string :origin

      t.timestamps
    end
  end
end
