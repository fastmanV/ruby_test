class AddMessages < ActiveRecord::Migration
  def change
 add_column :messages, :text, :text
 add_column :messages, :max_visit, :string
 add_column :messages, :current_visit, :string
 add_column :messages, :del_timer, :string
 add_column :messages, :created_at, :datetime
  end
end
