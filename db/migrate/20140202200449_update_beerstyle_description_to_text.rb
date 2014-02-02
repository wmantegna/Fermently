class UpdateBeerstyleDescriptionToText < ActiveRecord::Migration
  def change
  	change_column :beer_styles, :description, :text
  end
end
