class CreateUsersBeers < ActiveRecord::Migration
  def change
    create_table :beers_users do |t|
    	t.references :user
    	t.references :beer

      t.timestamps
    end
  end
end
