class CreateWedding < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.date :date
      t.references :groom, index: true
      t.references :bride, index: true
    end
    add_foreign_key :weddings, :grooms
    add_foreign_key :weddings, :brides
  end
end
