class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :descent
      t.string :body

      t.timestamps
    end
  end
end
