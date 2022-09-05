class CreateAudits < ActiveRecord::Migration[7.0]
  def change
    create_table :audits do |t|
      t.string :received
      t.decimal :result
      t.string :statistic

      t.timestamps
    end
  end
end
