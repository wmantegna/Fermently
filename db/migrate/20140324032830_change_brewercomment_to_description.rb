class ChangeBrewercommentToDescription < ActiveRecord::Migration
  def change
  	rename_column :beers, :brewerComment, :description
  end
end
