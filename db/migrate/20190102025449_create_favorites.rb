class CreateFavorites < ActiveRecord::Migration[5.2]
  def up
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :picture, foreign_key: true

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end