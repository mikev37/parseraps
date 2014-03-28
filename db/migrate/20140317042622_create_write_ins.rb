class CreateWriteIns < ActiveRecord::Migration
  def change
    create_table :write_ins do |t|
      t.string :address
      t.string :input

      t.timestamps
    end
  end
end
