class AddUserToPictures < ActiveRecord::Migration[5.2]
  def up
    add_reference :pictures, :user, foreign_key: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end
