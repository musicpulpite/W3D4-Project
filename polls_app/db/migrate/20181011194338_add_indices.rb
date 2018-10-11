class AddIndices < ActiveRecord::Migration[5.2]
  def change

    add_index :users, :username
    add_index :polls, :title
    add_index :questions, :text
    add_index :answer_choices, :text
  end
end
