#class Message < ActiveRecord::Base

#end

class Message < ActiveRecord::Base
  validates_presence_of :name
end