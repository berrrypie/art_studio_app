class AddCoursesToUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :courses_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :course
  end
end
end
