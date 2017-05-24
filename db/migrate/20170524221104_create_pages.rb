class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :permalink, index: true
      t.integer :position
      t.boolean :visible, default: false
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end


  end
end
