require 'test_helper'

class FilaTest < ActiveSupport::TestCase
	test "fila vacía" do
		assert !Fila.new().save(), "Se guardó una fila vacía"
	end

	test "presencia de atributos" do
		@fila = Fila.new()
		@fila.palabra = "x"
		assert !@fila.save(), "Se guardó una fila sin significado"
		@fila = Fila.new()
		@fila.significado = "x"
		assert !@fila.save(), "Se guardó una fila sin palabra"
	end

	test "guardar" do
		@fila = Fila.new()
		@fila.palabra = "x"
		@fila.significado = "x"
		assert @fila.save(), "No se pudo guardar la fila"
	end
end

		# @fila.imagen = "x"
		# @fila.audio = "x"
		# @fila.sinonimos = "x"
		# @fila.antonimos = "x"