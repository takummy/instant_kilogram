class CreatePictures < ActiveRecord::Migration[5.2]
  def up
    create_table :pictures do |t|
      t.string :image, null: false, default: ""
      t.text :content, null:false, default: ""

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end