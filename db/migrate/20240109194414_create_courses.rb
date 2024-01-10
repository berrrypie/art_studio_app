class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :duration
      t.string :date
      t.string :audit
      t.decimal:price
    end
  end
end
