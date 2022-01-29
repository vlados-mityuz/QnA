class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.references :question, foreign_key: true, null: false, on_delete: :cascade

      t.timestamps
    end
  end
end
