class AddReferencesToGarden < ActiveRecord::Migration[6.1]
  def change
    add_reference :plants, :garden, foreign_key: true
  end
end
