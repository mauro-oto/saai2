class List < ActiveRecord::Base
  has_many :filas
  belongs_to :user
end
