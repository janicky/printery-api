class CreateColorPalettes < ActiveRecord::Migration[5.2]
  def change
    create_table :color_palettes do |t|
      t.string :name
      t.decimal :price
    end
  end
end
