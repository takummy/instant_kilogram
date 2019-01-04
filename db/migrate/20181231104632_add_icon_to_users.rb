class AddIconToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :icon, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end
