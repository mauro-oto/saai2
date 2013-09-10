class Fila < ActiveRecord::Base
  belongs_to :list
  def self.random_word
	Fila.find(rand(Fila.count) + 1).palabra.upcase
  end	
end
