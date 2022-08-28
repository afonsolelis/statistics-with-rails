# frozen_string_literal: true

class CreateMeans < ActiveRecord::Migration[7.0]
  def change
    create_table :means do |t|
      t.string :received
      t.decimal :result

      t.timestamps
    end
  end
end
