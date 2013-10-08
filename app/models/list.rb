class List < ActiveRecord::Base
  has_many :filas
  belongs_to :user

  #nombre
  validates :nombre, presence: true
  #idiomaNativo
  validates :idiomaNativo, presence: true
  #idiomaForaneo
  validates :idiomaForaneo, presence: true
end
