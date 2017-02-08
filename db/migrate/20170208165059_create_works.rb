class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :artist, :string
      t.column :author, :string
      t.column :avgrating, :integer
      t.column :subgenre, :string
      t.column :image, :string

      t.timestamps
    end
  end
end
