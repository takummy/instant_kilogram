class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :image, null: false, default: ""
      t.text :content, null:false, default: ""

      t.timestamps
    end
  end
end
