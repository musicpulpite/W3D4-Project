class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.integer :user_id, null:false
      t.string :title, null:false
      t.timestamps
    end

    create_table :questions do |t|
      t.string :text, null:false
      t.integer :poll_id, null:false
      t.timestamps
    end

    create_table :answer_choices do |t|
      t.integer :question_id, null:false
      t.string :text, null:false
      t.timestamps
    end

    create_table :responses do |t|
      t.integer :answer_choice_id, null:false
      t.integer :user_id, null:false
      t.timestamps
    end
  end
end
