class AddImageToPictures < ActiveRecord::Migration[5.2]
  def up
    add_column :pictures, :image, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end