class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string     :card_name    ,null:false
      t.text       :content ,limit:1000
      t.references :tasklist,foreign_key: true
      t.timestamps
    end
  end
end
