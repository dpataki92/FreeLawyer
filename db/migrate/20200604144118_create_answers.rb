class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :anwers do |t|
      t.string :content
      t.integer :upvotes
      t.integer :question_id
      t.integer :lawyer_id
      t.timestamps
    end
  end
end
