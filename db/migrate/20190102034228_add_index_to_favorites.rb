class AddIndexToFavorites < ActiveRecord::Migration[5.2]
  def up
    add_index :favorites, %i(user_id picture_id), unique: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end
