class CreateInteractions < ActiveRecord::Migration[5.0]
  def change
    create_table :interactions do |t|
    	t.references :groop, index: true, foreign_key: true
      t.string     :type_of_interaction
      t.date       :date

      t.timestamps
    end
  end
end
