class Featured < ActiveRecord::Base
  belongs_to :workshop
  belongs_to :teacher
  belongs_to :course
  belongs_to :picture
  belongs_to :melee
end
