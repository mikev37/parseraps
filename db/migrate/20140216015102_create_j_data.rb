class CreateJData < ActiveRecord::Migration
  def change
    create_table :j_data do |t|
      t.text :jInput
      t.text :jOutput

      t.timestamps
    end
  end
end
