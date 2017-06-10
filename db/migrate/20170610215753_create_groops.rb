class CreateGroops < ActiveRecord::Migration[5.0]
  def change
    create_table :groops do |t|

      t.timestamps
    end
  end
end
