class CreateCriticalQuestions < ActiveRecord::Migration
  def change
    create_table :critical_questions do |t|
      t.integer :scheme_id
      t.text :description

      t.timestamps
    end
  end
end
