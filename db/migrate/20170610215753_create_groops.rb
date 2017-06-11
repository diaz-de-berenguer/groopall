class CreateGroops < ActiveRecord::Migration[5.0]
  def change
    create_table :groops do |t|
    	t.string     :nickname
    	t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
