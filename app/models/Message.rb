class Message < ActiveRecord::Base
  validates :text, :presence => { :message => "Поле текст не может быть пустым"}, :on => :create

end