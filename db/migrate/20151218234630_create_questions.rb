class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :message
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
