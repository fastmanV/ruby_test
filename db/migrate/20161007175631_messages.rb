class Messages < ActiveRecord::Migration
  def change
create_table :messages do |t|
      t.string :name
    end

  end
end
