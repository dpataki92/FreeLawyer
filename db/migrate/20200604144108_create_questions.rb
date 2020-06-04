class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :description
      t.integer :client_id
      t.string :jurisdiction
      t.string :area
      t.timestamps
    end
  end
end
