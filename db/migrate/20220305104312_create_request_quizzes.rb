class CreateRequestQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :request_quizzes do |t|
      t.text :question
      t.text :answer
      t.text :choices_first
      t.text :choices_second
      t.text :choices_third
      t.text :choices_fourth
      t.text :explanation

      t.timestamps
    end
  end
end
