class CreateLawyers < ActiveRecord::Migration
  def change
    create_table :lawyers do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :expertise
      t.string :jurisdiction
      t.integer :upvotes, default: 0
      t.timestamps
    end
  end
end
