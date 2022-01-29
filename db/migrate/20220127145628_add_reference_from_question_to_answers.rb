class AddReferenceFromQuestionToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :answer, foreign_key: true, null: false, on_delete: :cascade
  end
end
