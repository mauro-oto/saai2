class Fila < ActiveRecord::Base
  belongs_to :list
  def self.random_word
	Fila.offset(rand(Fila.count)).first.palabra.upcase
  end	

  #palabra
  validates :palabra, presence: true
  #significado
  validates :significado, presence: true
end
