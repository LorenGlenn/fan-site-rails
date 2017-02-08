class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.column :name, :string
      t.column :details, :string
      t.column :rating, :float
      t.column :work_id, :integer

      t.timestamps
    end
  end
end
