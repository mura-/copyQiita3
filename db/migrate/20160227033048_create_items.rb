class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false, default: ""
      t.text :content, null: false, default: ""
      t.references :user

      t.timestamps null: false
    end
  end
end
