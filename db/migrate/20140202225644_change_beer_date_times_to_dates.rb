class ChangeBeerDateTimesToDates < ActiveRecord::Migration
  def change
  	change_column :beers, :dateBrewed, :date
  	change_column :beers, :dateBottled, :date
  end
end
