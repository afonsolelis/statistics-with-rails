class CreateMedians < ActiveRecord::Migration[7.0]
  def change
    create_table :medians do |t|
      t.string :received
      t.decimal :result

      t.timestamps
    end
  end
end
