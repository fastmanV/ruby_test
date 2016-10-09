class EmptyMsg < ActiveRecord::Migration
  def change
remove_column(:messages, :name)
#Messages.delete_all
  end
end
