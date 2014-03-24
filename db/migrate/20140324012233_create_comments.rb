class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :beer
      t.references :user
      t.string :text

      t.timestamps
    end
  end
end
