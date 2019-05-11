class AddNullToPictures < ActiveRecord::Migration[5.2]
  def up
    change_column_null :pictures, :image, false
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end