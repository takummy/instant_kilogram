class AddDefaultToImageColumn < ActiveRecord::Migration[5.2]
  def up
    change_column_default :pictures, :image, ""
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end