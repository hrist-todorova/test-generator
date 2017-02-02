ActiveRecord::Schema.define do
  create_table :questions do |table|
    table.column :category, :string
    table.column :description, :string
    table.column :text, :string
  end

  create_table :answers do |table|
  end
end
