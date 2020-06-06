class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :upvotes, default: 0
      t.integer :lawyer_id
      t.integer :question_id
      t.timestamps
    end
  end
end
