ActiveRecord::Schema.define do
  create_table :questions do |table|
    table.column :category, :string
    table.column :description, :string
    table.column :text, :string
    table.column :picture, :string
  end

  create_table :answers do |table|
    table.column :question_id, :integer
    table.column :iscorrect, :integer
    table.column :text, :string
  end
end
